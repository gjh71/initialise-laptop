Install-User -Username "User" -Description "LocalAdmin" -FullName "Local Admin by Powershell" -Password "Password01"
Add-GroupMember -Name 'Administrators' -Member 'User'