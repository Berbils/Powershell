$psdir = "C:\Tools\PS Scripts"
Import-Module ActiveDirectory

Function Get-Expiration # Gets AD account Expiration
{
$u = Read-Host "What username?"
Get-ADUser -Identity $u -Properties PasswordExpired,LockedOut | FL Name, PasswordExpired, LockedOut
}

Function Start-RemoteRegistry #Start Remote Registry service
{
$u = Read-Host "What PC?"
Set-Service -name RemoteRegistry -ComputerName $u -Status Running}

Function Connect-Exchange #Connect to Exchange 2010
{$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionURI http://{Server}/powershell/ -Authentication kerberos -Credential (Get-Credential)
import-PSSession $session}