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

Get-ChildItem -Recurse -Filter *.json | Foreach-Object {
    $install = 0
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($_)
    while ($install -ne "y" -and $install -ne "n") {
        $install = Read-Host "Install $fileName stuff? (y/n) "
        if ($install -eq "y") {
            $json = Get-Content -Raw -Path $_.FullName | ConvertFrom-Json
            $json | ForEach-Object {
                $mode = $_.mode
                $id = $_.identifier
                $source = $_.source
                $scope = $_.scope
                winget.exe install --$mode $id -e -s $source --scope $scope --accept-package-agreements --accept-source-agreements --force
            }
        }
    }
}
