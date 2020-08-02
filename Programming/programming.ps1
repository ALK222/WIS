$programming = "0"

while ($programming -ne "y" -and $programming -ne "n") {
    $programming = Read-Host "Install programming stuff? (y/n) "
    if ($programming -eq "y") {
        foreach ($line in Get-Content $PSSCriptRoot\programming.txt) {
            if ($line.contains("#")) {
                continue
            }
            winget install --id $line -e        
        }
    }
}
