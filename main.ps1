$proc = Get-WmiObject -Class Win32_Processor | Select-Object -Property Name

Write-Host "Installing CPU driver assistant"
if ($proc -match "Intel") {
    winget install --id Intel.IntelDriverAndSupportAssistant -e
}
elseif ($proc -match "AMD") {
    Write-host "Driver assistant not found"
}
else {
    Write-Host "Driver assistant for CPU not installed"
}
$gpus = Get-WmiObject -Class Win32_VideoController | Select-Object -Property Description
Write-Host "Installing GPU driver assistant"
foreach ($gpu in $gpus) {
    if ($gpu -match "NVIDIA") {
        winget install --id Nvidia.GeForceExperience -e 
    }
    elseif ($gpu -match "AMD") {
        Write-host "Driver for AMD GPUs not found"
    }
}

#Programming script
.\Programming\programming.ps1

#Games script
.\Games\Games.ps1

#Util script
.\Utils\Utils.ps1


#Uninstal shit
.\Uninstall\Uninstal.ps1
