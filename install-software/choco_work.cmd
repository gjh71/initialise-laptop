set chocoinstall=%~dp0Chocolatey_installer.ps1
set PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

REM Trying to avoid that Avast interferes...
copy %chocoinstall% %temp%\install.ps1
REM powershell -noprofile -executionpolicy bypass -file %temp%\install.ps1

REM Download / install chocolatey
REM powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco feature enable -n allowGlobalConfirmation

REM Infra
choco install windirstat 
choco install filezilla 
REM choco install putty 
choco install microsoftazurestorageexplorer 
choco install keepass 
choco install azcopy 
choco install choco-upgrade-all-at-startup
choco install patch-my-pc
choco install imdisk
choco install imdisk-toolkit
choco install 7zip

REM Tools
choco install sysinternals  /InstallDir c:\tools
choco install logparser.lizardgui 
choco install fiddler 
choco install ilspy 
choco install postman 
choco install octopustools
choco install xplorer2pro
choco install docker-desktop
choco install cake.portable
choco install cascadiacode
choco install iiscrypto
choco install keepass
choco install keepass-keepasshttp
choco install quiterss
choco install vnc-viewer
choco install authy-desktop

REM Editors
choco install notepadplusplus.install 
choco install visualstudiocode 
choco install azure-data-studio
choco install winmerge 
choco install linqpad 
choco install irfanview

REM Coding
REM choco install sql-server-2019
choco install git
choco install git.extensions

choco install visualstudio2019professional
choco install visualstudio2019-workload-netweb
choco install visualstudio2019-workload-manageddesktop
choco install visualstudio2019-workload-data
choco install sql-server-management-studio 
choco install tortoisegit
choco install gitextensions 
REM choco install nodejs

REM Powershell modules
choco install poshgit 
choco install psake 
choco install pester 

