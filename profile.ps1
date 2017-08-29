$psdir = "C:\Tools\PS Scripts"
Import-Module ActiveDirectory
Import-Module NTFSSecurity

Function Get-Expiration # Checks AD to see if an account is expired or locked out
{
$u = Read-Host "What username?"
Get-ADUser -Identity $u -Properties PasswordExpired,LockedOut | FL Name, PasswordExpired, LockedOut
}

Function Start-RemoteRegistry # Starts Remote Registry service
{
$u = Read-Host "What PC?"
Set-Service -name RemoteRegistry -ComputerName $u -Status Running}

Function Connect-Exchange # Connects to Exchange
{$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionURI http://LaCapSvr31/powershell/ -Authentication kerberos -Credential (Get-Credential)
import-PSSession $session}

Function Find-Account # Queries AD for SamID and Name fields
{$Name = Read-Host -prompt "User?"
Get-ADUser -f {GivenName -eq $Name} | FL Name, SamAccountName}

Function Get-GUID # Retrieves all GUIDs for installed applications
{
    get-wmiobject Win32_Product | Format-Table IdentifyingNumber, Name, LocalPackage -AutoSize
}