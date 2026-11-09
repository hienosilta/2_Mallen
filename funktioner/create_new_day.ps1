Write-Output ""
Write-Output ">>> create_new_day.ps1 körs"

$datum = Get-Date -Format "yyyyMMdd"
$newFile = "$datum.html"

if (-Not (Test-Path $newFile)) {
    New-Item -ItemType File -Path $newFile
    Write-Output "Ny fil skapad: $newFile"
}

Invoke-Item $newFile

Write-Output ">>> Scriptet är klart."


