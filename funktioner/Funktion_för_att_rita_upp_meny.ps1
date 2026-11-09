# Funktion_för_att_rita_upp_meny.ps1- Heter filen

# Funktion för att rita upp menyn med piltangentsnavigation
function Visa-PilMeny {
    param (
        [string]$Titel,
        [array]$Alternativ
    )

    $ValtIndex = 0
    $Körs = $true

    # Göm markören för en snyggare meny (valfritt)
    [Console]::CursorVisible = $false

    while ($Körs) {
        Clear-Host
        Write-Host "=================================" -ForegroundColor Cyan
        Write-Host "       $Titel" -ForegroundColor Cyan
        Write-Host "=================================" -ForegroundColor Cyan
        Write-Host " (Använd piltangenterna och tryck Enter)`n" -ForegroundColor DarkGray

        # Rita ut alla alternativ och markera det som är valt
        for ($i = 0; $i -lt $Alternativ.Count; $i++) {
            if ($i -eq $ValtIndex) {
                # Det här är det aktiva valet
                Write-Host " -> [X] $($Alternativ[$i])" -ForegroundColor Green
            } else {
                # De andra valen
                Write-Host "    [ ] $($Alternativ[$i])" -ForegroundColor Gray
            }
        }
        Write-Host "`n=================================" -ForegroundColor Cyan

        # Läs av vilken tangent användaren trycker på
        $Tangent = [Console]::ReadKey($true)

        switch ($Tangent.Key) {
            'UpArrow' {
                $ValtIndex--
                if ($ValtIndex -lt 0) { $ValtIndex = $Alternativ.Count - 1 }
            }
            'DownArrow' {
                $ValtIndex++
                if ($ValtIndex -ge $Alternativ.Count) { $ValtIndex = 0 }
            }
            'Enter' {
                $Körs = $false # Avsluta loopen och returnera valet
            }
        }
    }

    # Återställ markören innan vi skickar tillbaka resultatet
    [Console]::CursorVisible = $true
    return $ValtIndex
}

# --- HÄR STARTAR SJÄLVA PROGRAMMET ---

$MenyVal = @(
    "Starta Anteckningar (Notepad)"
    "Visa IP-konfiguration"
    "Pinga Google"
    "Avsluta programmet"
)

$Loop = $true
while ($Loop) {
    # Anropa vår menyfunktion
    $Resultat = Visa-PilMeny -Titel "MIN AVANCERADE DOS-MENY" -Alternativ $MenyVal

    # Hantera resultatet baserat på vilket index (0-3) som valdes
    switch ($Resultat) {
        0 {
            Write-Host "`nStartar Notepad..." -ForegroundColor Green
            Start-Process notepad
            Start-Sleep -Seconds 1
        }
        1 {
            Clear-Host
            ipconfig
            Read-Host "`nTryck på Enter för att återgå"
        }
        2 {
            Clear-Host
            ping 8.8.8.8 -n 4
            Read-Host "`nTryck på Enter för att återgå"
        }
        3 {
            Write-Host "`nAvslutar... Ha en trevlig kväll!" -ForegroundColor Yellow
            $Loop = $false
            Start-Sleep -Seconds 1
        }
    }
}