# 在 %LOCALAPPDATA%\Google\Chrome\Application 创建目录联接
# 使硬编码查找 Chrome 默认安装路径的软件能发现 Scoop 安装的 Chrome

$target = Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "App"
$linkPath = Join-Path $env:LOCALAPPDATA "Google\Chrome\Application"

if (Test-Path $linkPath) {
    $item = Get-Item $linkPath -Force
    if ($item.LinkType -eq 'Junction') {
        Write-Host "Junction already exists: $linkPath -> $($item.Target)" -ForegroundColor Yellow
        return
    }
    Write-Warning "A real directory already exists at '$linkPath'. This may be an existing Chrome installation. Aborting."
    return
}

$parentDir = Split-Path -Parent $linkPath
if (-not (Test-Path $parentDir)) {
    New-Item -ItemType Directory -Path $parentDir -Force | Out-Null
}

New-Item -ItemType Junction -Path $linkPath -Target $target | Out-Null
Write-Host "Junction created: $linkPath -> $target" -ForegroundColor Green
