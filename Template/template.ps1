$confirmation = "0"

while ($confirmation -ne "y" -and $confirmation -ne "n") {
    $confirmation = Read-Host "Install EXAMPLE stuff? (y/n) "
    if ($confirmation -eq "y") {
        foreach ($line in Get-Content $PSSCriptRoot\newFile.txt) {
            if ($line.contains("#")) {
                continue
            }
            winget install --id $line -e        
        }
    }
}
