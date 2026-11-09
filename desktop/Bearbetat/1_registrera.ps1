
# Textfält för Förnamn
$TextForname = New-Object System.Windows.Forms.TextBox
$TextForname.Location = New-Object System.Drawing.Point(130,30)
$TextForname.Width = 160
$Form.Controls.Add($TextForname)



# Vad som hÃ¤nder nÃ¤r man klickar pÃ¥ Spara
$ButtonSave.Add_Click({
    $Forname = $TextForname.Text.Trim()
    $Surname = $TextSurname.Text.Trim()

    if ($Forname -eq "" -or $Surname -eq "") {
        [System.Windows.Forms.MessageBox]::Show("VÃ¤nligen fyll i bÃ¥de fÃ¶r- och efternamn.", "Fel", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    } else {
        # Skapa textraden som ska sparas
        $Data = "$DagensDatum - $Forname $Surname"

        # Spara till filen (lÃ¤gger till i slutet om filen redan finns)
        Add-Content -Path $SparadFil -Value $Data

        # Visa bekrÃ¤ftelse och var filen sparades
        [System.Windows.Forms.MessageBox]::Show("Uppgifterna har sparats!`n`nFilen finns hÃ¤r:`n$SparadFil", "Klart!", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

        # StÃ¤ng formulÃ¤ret
        $Form.Close()
    }
})
$Form.Controls.Add($ButtonSave)

# Visa formulÃ¤ret pÃ¥ skÃ¤rmen
$Form.ShowDialog() | Out-Null
