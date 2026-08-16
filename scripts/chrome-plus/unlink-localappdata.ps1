# 移除 %LOCALAPPDATA%\Google\Chrome\Application 目录联接

$linkPath = Join-Path $env:LOCALAPPDATA "Google\Chrome\Application"

if (-not (Test-Path $linkPath)) {
    Write-Host "No junction found at '$linkPath'." -ForegroundColor Yellow
    return
}

$item = Get-Item $linkPath -Force
if ($item.LinkType -ne 'Junction') {
    Write-Warning "'$linkPath' is not a junction. Aborting to prevent data loss."
    return
}

# 使用 .NET 方法安全删除联接，不影响目标目录内容
(Get-Item $linkPath).Delete()
Write-Host "Junction removed: $linkPath" -ForegroundColor Green

# 清理空的父级目录
$parentDir = Join-Path $env:LOCALAPPDATA "Google\Chrome"
if ((Test-Path $parentDir) -and @(Get-ChildItem $parentDir -Force).Count -eq 0) {
    Remove-Item $parentDir -Force
}
