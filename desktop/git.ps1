Write-Output ""
Write-Output "========================================"
Write-Output ">>> Git.ps1 körs"
Write-Output "========================================"
Write-Output ""

# Hämta dagens datum för commit-meddelandet
$datum = Get-Date -Format "yyyy-MM-dd"

# Kontrollera om det finns ändringar
$changes = git status --porcelain

if ($changes) {
    Write-Output "Ändringar hittade – commit och push utförs."
    git add .
    git commit -m "Automatisk morgoncommit: $datum"
    git push
    Write-Output "Push klar."
}
else {
    Write-Output "Inga ändringar – ingen commit gjordes."
}

Write-Output ""
Write-Output ">>> Scriptet är klart."
Write-Output "========================================"
Write-Output ""
