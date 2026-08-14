#Requires -Version 5.1
#Requires -Modules @{ ModuleName = 'BuildHelpers'; ModuleVersion = '2.0.1' }
#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '5.2.0' }

# Rojem-Scoop 测试入口（自维护）。
#
# 官方测试框架（$env:SCOOP_HOME\test\Import-Bucket-Tests.ps1）的文件风格测试
# 会递归扫描整个仓库工作树，其排除列表写死（仅 .git/、.sublime-workspace、
# .DS_Store、supporting/validator/packages），无法排除本仓库特有的两个目录：
#   - docs/scoop-wiki：Scoop 官方 Wiki 的 git 子模块，内容来自上游，非本仓库
#   - .claude/：Claude Code 本地工具配置，已加入 .gitignore
# 若继续复用官方入口，以上目录会导致本地 test.ps1 出现 3 个误报失败。
# 因此这里内联官方的文件风格测试与 manifest 校验，并追加对上述目录的排除。

param(
    [String] $BucketPath = $PSScriptRoot
)

if (!$env:SCOOP_HOME) { $env:SCOOP_HOME = Resolve-Path (scoop prefix scoop) }

BeforeDiscovery {
    $project_file_exclusions = @(
        '[\\/]\.git[\\/]',
        '\.sublime-workspace$',
        '\.DS_Store$',
        'supporting(\\|/)validator(\\|/)packages(\\|/)*',
        '[\\/]docs[\\/]scoop-wiki[\\/]',
        '[\\/]\.claude[\\/]'
    )
    $repo_files = (Get-ChildItem $BucketPath -File -Recurse).FullName |
        Where-Object { $_ -inotmatch $($project_file_exclusions -join '|') }
}

Describe 'Code Syntax' -ForEach @(, $repo_files) -Tag 'File' {
    BeforeAll {
        $files = @(
            $_ | Where-Object { $_ -imatch '.(ps1|psm1)$' }
        )
        function Test-PowerShellSyntax {
            # ref: http://powershell.org/wp/forums/topic/how-to-check-syntax-of-scripts-automatically @@ https://archive.is/xtSv6
            # originally created by Alexander Petrovskiy & Dave Wyatt
            [CmdletBinding()]
            param (
                [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
                [string[]]
                $Path
            )

            process {
                foreach ($scriptPath in $Path) {
                    $contents = Get-Content -Path $scriptPath

                    if ($null -eq $contents) {
                        continue
                    }

                    $errors = $null
                    $null = [System.Management.Automation.PSParser]::Tokenize($contents, [ref]$errors)

                    New-Object psobject -Property @{
                        Path              = $scriptPath
                        SyntaxErrorsFound = ($errors.Count -gt 0)
                    }
                }
            }
        }

    }

    It 'PowerShell code files do not contain syntax errors' {
        $badFiles = @(
            foreach ($file in $files) {
                if ( (Test-PowerShellSyntax $file).SyntaxErrorsFound ) {
                    $file
                }
            }
        )

        if ($badFiles.Count -gt 0) {
            throw "The following files have syntax errors: `r`n`r`n$($badFiles -join "`r`n")"
        }
    }

}

Describe 'Style constraints for non-binary project files' -ForEach @(, $repo_files) -Tag 'File' {
    BeforeAll {
        $files = @(
            # gather all files except '*.exe', '*.zip', or any .git repository files
            $_ |
                Where-Object { $_ -inotmatch '(.exe|.zip|.dll)$' } |
                Where-Object { $_ -inotmatch '(unformatted)' }
        )
    }

    It 'files do not contain leading UTF-8 BOM' {
        # UTF-8 BOM == 0xEF 0xBB 0xBF
        # see http://www.powershellmagazine.com/2012/12/17/pscxtip-how-to-determine-the-byte-order-mark-of-a-text-file @@ https://archive.is/RgT42
        # ref: http://poshcode.org/2153 @@ https://archive.is/sGnnu
        $badFiles = @(
            foreach ($file in $files) {
                if ((Get-Command Get-Content).parameters.ContainsKey('AsByteStream')) {
                    # PowerShell Core (6.0+) '-Encoding byte' is replaced by '-AsByteStream'
                    $content = ([char[]](Get-Content $file -AsByteStream -TotalCount 3) -join '')
                } else {
                    $content = ([char[]](Get-Content $file -Encoding byte -TotalCount 3) -join '')
                }
                if ([regex]::match($content, '(?ms)^\xEF\xBB\xBF').success) {
                    $file
                }
            }
        )

        if ($badFiles.Count -gt 0) {
            throw "The following files have utf-8 BOM: `r`n`r`n$($badFiles -join "`r`n")"
        }
    }

    It 'files end with a newline' {
        $badFiles = @(
            foreach ($file in $files) {
                # Ignore previous TestResults.xml
                if ($file -match 'TestResults.xml') {
                    continue
                }
                $string = [System.IO.File]::ReadAllText($file)
                if ($string.Length -gt 0 -and $string[-1] -ne "`n") {
                    $file
                }
            }
        )

        if ($badFiles.Count -gt 0) {
            throw "The following files do not end with a newline: `r`n`r`n$($badFiles -join "`r`n")"
        }
    }

    It 'file newlines are CRLF' {
        $badFiles = @(
            foreach ($file in $files) {
                $content = [System.IO.File]::ReadAllText($file)
                if (!$content) {
                    throw "File contents are null: $($file)"
                }
                $lines = [regex]::split($content, '\r\n')
                $lineCount = $lines.Count

                for ($i = 0; $i -lt $lineCount; $i++) {
                    if ( [regex]::match($lines[$i], '\r|\n').success ) {
                        $file
                        break
                    }
                }
            }
        )

        if ($badFiles.Count -gt 0) {
            throw "The following files have non-CRLF line endings: `r`n`r`n$($badFiles -join "`r`n")"
        }
    }

    It 'files have no lines containing trailing whitespace' {
        $badLines = @(
            foreach ($file in $files) {
                # Ignore previous TestResults.xml
                if ($file -match 'TestResults.xml') {
                    continue
                }
                $lines = [System.IO.File]::ReadAllLines($file)
                $lineCount = $lines.Count

                for ($i = 0; $i -lt $lineCount; $i++) {
                    if ($lines[$i] -match '\s+$') {
                        'File: {0}, Line: {1}' -f $file, ($i + 1)
                    }
                }
            }
        )

        if ($badLines.Count -gt 0) {
            throw "The following $($badLines.Count) lines contain trailing whitespace: `r`n`r`n$($badLines -join "`r`n")"
        }
    }

    It 'any leading whitespace consists only of spaces (excepting makefiles)' {
        $badLines = @(
            foreach ($file in $files) {
                if ($file -inotmatch '(^|.)makefile$') {
                    $lines = [System.IO.File]::ReadAllLines($file)
                    $lineCount = $lines.Count

                    for ($i = 0; $i -lt $lineCount; $i++) {
                        if ($lines[$i] -notmatch '^[ ]*(\S|$)') {
                            'File: {0}, Line: {1}' -f $file, ($i + 1)
                        }
                    }
                }
            }
        )

        if ($badLines.Count -gt 0) {
            throw "The following $($badLines.Count) lines contain TABs within leading whitespace: `r`n`r`n$($badLines -join "`r`n")"
        }
    }

}

Describe 'Manifest validates against the schema' {
    BeforeDiscovery {
        $bucketDir = if (Test-Path "$BucketPath\bucket") {
            "$BucketPath\bucket"
        } else {
            $BucketPath
        }
        if ($env:CI -eq $true) {
            Set-BuildEnvironment -Force
            $manifestFiles = @(Get-GitChangedFile -Path $bucketDir -Include '*.json' -Commit $env:BHCommitHash)
        } else {
            $manifestFiles = (Get-ChildItem $bucketDir -Filter '*.json' -Recurse).FullName
        }
    }
    BeforeAll {
        Add-Type -Path "$env:SCOOP_HOME\supporting\validator\bin\Scoop.Validator.dll"
        # Could not use backslash '\' in Linux/macOS for .NET object 'Scoop.Validator'
        $validator = New-Object Scoop.Validator("$env:SCOOP_HOME/schema.json", $true)
        $global:quotaExceeded = $false
    }
    It '<_>' -TestCases $manifestFiles {
        if ($global:quotaExceeded) {
            Set-ItResult -Skipped -Because 'Schema validation limit exceeded.'
        } else {
            $file = $_ # exception handling may overwrite $_
            try {
                $validator.Validate($file)
                if ($validator.Errors.Count -gt 0) {
                    Write-Host "  [-] $_ has $($validator.Errors.Count) Error$(If($validator.Errors.Count -gt 1) { 's' })!" -ForegroundColor Red
                    Write-Host $validator.ErrorsAsString -ForegroundColor Yellow
                }
                $validator.Errors.Count | Should -Be 0
            } catch {
                if ($_.Exception.Message -like '*The free-quota limit of 1000 schema validations per hour has been reached.*') {
                    $global:quotaExceeded = $true
                    Set-ItResult -Skipped -Because 'Schema validation limit exceeded.'
                } else {
                    throw
                }
            }
        }
    }
}
