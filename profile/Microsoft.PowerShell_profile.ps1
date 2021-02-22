# Powershell Core v.7
Import-Module posh-git
if ($host.Version -lt "7.0.0.0"){
	Set-Location c:\
}
else {
	# note: Get Cascadia Code PL font from: https://github.com/microsoft/cascadia-code/releases and install to c:\windows\fonts\
	Import-Module oh-my-posh,prtgapi
	Set-PoshPrompt -theme paradox
	Set-Location c:\repos

	$prtgserver = "cowmanager.my-prtg.com"
	$prtgCredential = New-Credential "$env:USERNAME@cowmanager.com" $env:passhash
	#Disconnect-PrtgServer
	if (!(Get-PrtgClient)) {
		Connect-PrtgServer -Server $prtgserver -Credential $prtgCredential -PassHash #-IgnoreSSL
		Write-Host("PrtgApi connected to $prtgserver as $env:USERNAME") -ForegroundColor Cyan
	} 
}

Write-host("{0} loaded" -f $profile) -foregroundcolor yellow
Write-host("Powershell version: {0}" -f $host.Version) -foregroundcolor green