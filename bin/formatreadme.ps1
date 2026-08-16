<#
.SYNOPSIS
    自动向 README.md 应用列表中插入新条目，按 APP 显示名字母顺序排序。
.DESCRIPTION
    解析 README.md 中的 Markdown 表格，提取每行 APP 显示名，
    将新应用按字典序（忽略大小写）插入对应位置。
    支持插入和删除操作。
.PARAMETER Name
    应用显示名（APP 列显示的名称）。
.PARAMETER Url
    应用主页 URL。
.PARAMETER Manifest
    清单文件名（不含 .json 后缀）。
.PARAMETER Description
    一句话中文简介。
.PARAMETER Persist
    持久化状态。可选值：Y（✔）、N（❌）、NA（🈚️）。默认 Y。
.PARAMETER Remove
    删除模式。指定要删除的 Manifest 名称。
.EXAMPLE
    .\bin\formatreadme.ps1 -Name "Keymap" -Url "https://github.com/cataerogong/keymap" -Manifest "keymap" -Description "快捷键可视化与记录工具" -Persist Y
.EXAMPLE
    .\bin\formatreadme.ps1 -Remove "keymap"
#>
[CmdletBinding(DefaultParameterSetName = 'Add')]
param(
    [Parameter(Mandatory, ParameterSetName = 'Add')]
    [string]$Name,

    [Parameter(Mandatory, ParameterSetName = 'Add')]
    [string]$Url,

    [Parameter(Mandatory, ParameterSetName = 'Add')]
    [string]$Manifest,

    [Parameter(Mandatory, ParameterSetName = 'Add')]
    [string]$Description,

    [Parameter(ParameterSetName = 'Add')]
    [ValidateSet('Y', 'N', 'NA')]
    [string]$Persist = 'Y',

    [Parameter(Mandatory, ParameterSetName = 'Remove')]
    [string]$Remove
)

$readmePath = Join-Path $PSScriptRoot '..\README.md'
if (-not (Test-Path $readmePath)) {
    Write-Error "README.md not found at: $readmePath"
    exit 1
}

# 读取文件（保留 CRLF）
$content = [System.IO.File]::ReadAllText((Resolve-Path $readmePath).Path)
$lines = $content -split "`r`n"

# 定位表格：查找表头行和分隔行
$headerIndex = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '^\|\s*APP\s*\|.*Manifest.*\|.*Description.*\|.*Persist\s*\|') {
        $headerIndex = $i
        break
    }
}
if ($headerIndex -lt 0) {
    Write-Error "Cannot find the APP table header in README.md"
    exit 1
}

$separatorIndex = $headerIndex + 1

# 提取数据行范围
$dataStart = $separatorIndex + 1
$dataEnd = $dataStart
for ($i = $dataStart; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '^\|') {
        $dataEnd = $i
    } else {
        break
    }
}

# 提取所有数据行
$dataLines = @()
for ($i = $dataStart; $i -le $dataEnd; $i++) {
    $dataLines += $lines[$i]
}

# 从表格行中提取 APP 显示名
function Get-AppName([string]$line) {
    if ($line -match '^\|\s*\[([^\]]+)\]') {
        return $Matches[1]
    }
    return ''
}

# 从表格行中提取 Manifest 名
function Get-ManifestName([string]$line) {
    $cells = $line.TrimStart('|').Split('|')
    if ($cells.Count -ge 2) {
        return $cells[1].Trim()
    }
    return ''
}

if ($PSCmdlet.ParameterSetName -eq 'Remove') {
    # 删除模式
    $found = $false
    $newDataLines = @()
    foreach ($line in $dataLines) {
        if ((Get-ManifestName $line) -eq $Remove) {
            $found = $true
            Write-Host "已删除: $Remove" -ForegroundColor Yellow
        } else {
            $newDataLines += $line
        }
    }
    if (-not $found) {
        Write-Error "Manifest '$Remove' not found in the table."
        exit 1
    }
    $dataLines = $newDataLines
} else {
    # 插入模式：检查是否已存在
    foreach ($line in $dataLines) {
        if ((Get-ManifestName $line) -eq $Manifest) {
            Write-Error "Manifest '$Manifest' already exists in the table."
            exit 1
        }
    }

    # Persist 符号映射
    $persistMap = @{
        'Y'  = '✔'
        'N'  = '❌'
        'NA' = '🈚️'
    }
    $persistSymbol = $persistMap[$Persist]

    # 计算各列最大宽度（用于对齐）
    # 先构建新行内容（不含填充）
    $appCell = "[$Name]($Url)"
    $manifestCell = $Manifest
    $descCell = $Description
    $persistCell = $persistSymbol

    # 收集所有现有行的各列宽度
    function Get-Cells([string]$line) {
        $raw = $line.Trim().TrimStart('|').TrimEnd('|')
        $parts = $raw.Split('|')
        return $parts | ForEach-Object { $_.Trim() }
    }

    # 构建新行（对齐格式与现有行保持一致）
    $newLine = "| $($appCell.PadRight(60)) | $($manifestCell.PadRight(28)) | $($descCell.PadRight(60)) | $($persistCell.PadRight(7)) |"

    # 按字母顺序查找插入位置
    $insertIndex = $dataLines.Count
    for ($i = 0; $i -lt $dataLines.Count; $i++) {
        $existingName = Get-AppName $dataLines[$i]
        if ([string]::Compare($Name, $existingName, [System.StringComparison]::OrdinalIgnoreCase) -lt 0) {
            $insertIndex = $i
            break
        }
    }

    # 插入新行
    $newDataLines = @()
    for ($i = 0; $i -lt $dataLines.Count; $i++) {
        if ($i -eq $insertIndex) {
            $newDataLines += $newLine
        }
        $newDataLines += $dataLines[$i]
    }
    if ($insertIndex -eq $dataLines.Count) {
        $newDataLines += $newLine
    }
    $dataLines = $newDataLines

    Write-Host "已插入: [$Name]($Url) -> $Manifest (位置: $($insertIndex + 1))" -ForegroundColor Green
}

# 重组文件内容
$result = @()
# 表头之前的内容
for ($i = 0; $i -lt $headerIndex; $i++) {
    $result += $lines[$i]
}
# 表头和分隔行
$result += $lines[$headerIndex]
$result += $lines[$separatorIndex]
# 新数据行
$result += $dataLines
# 表格之后的内容
for ($i = $dataEnd + 1; $i -lt $lines.Count; $i++) {
    $result += $lines[$i]
}

# 写回文件（CRLF 换行）
$output = $result -join "`r`n"
[System.IO.File]::WriteAllText((Resolve-Path $readmePath).Path, $output)

Write-Host "README.md 已更新。" -ForegroundColor Cyan
