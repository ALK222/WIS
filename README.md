# Windows-Install-Script

Script using winget for easy windows setup

## How to create new categories

In main.ps1 put this line of code at the end of the script

```powershell
    .\NewFolder\NewScript.ps1
```

In the new folder create a .txt file with the app id's and a .ps1 with the file.txt name in the line

```powershell
    foreach ($line in Get-Content $PSSCriptRoot\newFile.txt)
```

And change the name of the category in

```powershell
    $confirmation = Read-Host "Install EXAMPLE stuff? (y/n) "
```
