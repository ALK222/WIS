$utils = "0"

while ($utils -ne "y" -and $utils -ne "n") {
    $utils = Read-Host "Install utils stuff? (y/n) "
    if ($utils -eq "y") {
        foreach ($line in Get-Content $PSSCriptRoot\utils.txt) {
            if ($line.contains("#")) {
                continue
            }
            winget install --id $line -e          
        }
    }
}
