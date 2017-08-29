# Sets Power Plan to High Performance and turns off Disk "sleep"
$p = gwmi -NS root\cimv2\power -Class win32_PowerPlan -Filter "ElementName ='High Performance'"
gwmi -NS root\cimv2\power -Class win32_PowerPlan -Filter "IsActive = 'true'"
powercfg.exe -x -disk-timeout-ac 0
powercfg.exe -x -disk-timeout-dc 0
Write-Host "Set Power Plan to High Performance"

# Copies install folder to PC
New-Item -type Directory -path C:\PCInstall
Copy-Item \\lacapsvr07\install\PCInstall\*.* C:\PCInstall
Write-Host "Copied PC Install folder to C:\PCInstall"

# Starts Remote Registry service
Set-Service -name RemoteRegistry -ComputerName $u -Status Running
Write-Host "Started Remote Registry service"

# Copies NovaTime link to Desktop
Copy-Item C:\PCInstall\NovaTime.url C:\Users\Public\Desktop
Write-Host "Copied NovaTime to Desktop"

#Copies Q2 to PC
New-Item -type Directory -path C:\Q2
Copy-Item \\lacapsvr07\install\inven\Q2Central\Q2\*.* C:\Q2
Write-Host "Copied Q2"

