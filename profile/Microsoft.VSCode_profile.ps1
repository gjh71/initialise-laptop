# Powershell Core v.7

$env:OctopusURL = "http://buildsvr01:8080"
$env:OctopusApiKey = "API-D4WTNKLDBVYGCHAE2CSEWWDMMU0"

# note: Get Cascadia Code PL font from: https://github.com/microsoft/cascadia-code/releases and install to c:\windows\fonts\
import-module oh-my-posh, prtgapi
set-poshprompt -theme paradox
#set-location c:\dev.cm

	$prtgserver = "cowmanager.my-prtg.com"
	$prtgCredential = New-Credential "$env:USERNAME@cowmanager.com" $env:passhash
	#Disconnect-PrtgServer
	if (!(Get-PrtgClient)) {
		Connect-PrtgServer -Server $prtgserver -Credential $prtgCredential -PassHash #-IgnoreSSL
		Write-Host("PrtgApi connected to $prtgserver as $env:USERNAME") -ForegroundColor Cyan
	} 

Write-host("{0} loaded" -f $profile) -foregroundcolor yellow