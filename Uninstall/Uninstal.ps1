Write-Host "Uninstalling Windows shit"

foreach ($line in Get-Content $PSSCriptRoot\Uninstall.txt) {
    if ($line.contains("#")) {
        continue
    }
    Get-AppxPackage $line | Remove-AppxPackage           
}
if (Test-Path HKCU:\Software\Microsoft\GameBar) { 
    Get-Item HKCU:\Software\Microsoft\GameBar | Set-ItemProperty -Name AllowAutoGameMode -Value 1 -Verbose -Force 
}
