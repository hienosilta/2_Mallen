
# Skickat från min iPhone 
# Lägg till stöd för grafiska Windows-formulär
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Hämta dagens datum
$DagensDatum = (Get-Date).ToString("yyyy-MM-dd")
$SparadFil = Join-Path -Path $env:USERPROFILE -ChildPath "Documents\registrerade_namn.txt"

# Skapa själva formulärfönstret
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Registrering - $DagensDatum"
$Form.Size = New-Object System.Drawing.Size(350,250)
$Form.StartPosition = "CenterScreen"

# Etikett för Förnamn
$LabelForname = New-Object System.Windows.Forms.Label
$LabelForname.Text = "Förnamn:"
$LabelForname.Location = New-Object System.Drawing.Point(30,30)
$LabelForname.AutoSize = $true
$Form.Controls.Add($LabelForname)

# Textfält för Förnamn
$TextForname = New-Object System.Windows.Forms.TextBox
$TextForname.Location = New-Object System.Drawing.Point(130,30)
$TextForname.Width = 160
$Form.Controls.Add($TextForname)

# Etikett för Efternamn
$LabelSurname = New-Object System.Windows.Forms.Label
$LabelSurname.Text = "Efternamn:"
$LabelSurname.Location = New-Object System.Drawing.Point(30,70)
$LabelSurname.AutoSize = $true
$Form.Controls.Add($LabelSurname)

# Textfält för Efternamn
$TextSurname = New-Object System.Windows.Forms.TextBox
$TextSurname.Location = New-Object System.Drawing.Point(130,70)
$TextSurname.Width = 160
$Form.Controls.Add($TextSurname)

# Spara-knapp
$ButtonSave = New-Object System.Windows.Forms.Button
$ButtonSave.Text = "Spara"
$ButtonSave.Location = New-Object System.Drawing.Point(130,120)
$ButtonSave.Width = 80

# Vad som händer när man klickar på Spara
$ButtonSave.Add_Click({
    $Forname = $TextForname.Text.Trim()
    $Surname = $TextSurname.Text.Trim()

    if ($Forname -eq "" -or $Surname -eq "") {
        [System.Windows.Forms.MessageBox]::Show("Vänligen fyll i både för- och efternamn.", "Fel", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    } else {
        # Skapa textraden som ska sparas
        $Data = "$DagensDatum - $Forname $Surname"
        
        # Spara till filen (lägger till i slutet om filen redan finns)
        Add-Content -Path $SparadFil -Value $Data
        
        # Visa bekräftelse och var filen sparades
        [System.Windows.Forms.MessageBox]::Show("Uppgifterna har sparats!`n`nFilen finns här:`n$SparadFil", "Klart!", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        
        # Stäng formuläret
        $Form.Close()
    }
})
$Form.Controls.Add($ButtonSave)

# Visa formuläret på skärmen
$Form.ShowDialog() | Out-Null

