param(
	[Parameter(Mandatory=$true)]
    [String]$DbServerInstance,
    [Parameter(Mandatory=$true)]
    [String]$DbBackupFolder,
	[Parameter(Mandatory=$true)]
    [String]$DbDataFolder
)


ForEach ($DbBackupFile in Get-ChildItem $DbBackupFolder -Filter *.bak) { 
 $TargetDatabase = $DbBackupFile.Name.Split("_")[0]


Write-Verbose "Restoring $TargetDatabase database - Start" -Verbose



#Import SQL module to be able to use invoke-sqlcmd
#Note: might be needed to install https://www.microsoft.com/en-us/download/details.aspx?id=29065
Import-Module sqlps -DisableNameChecking
$DbBackupPath = $DbBackupFile.FullName

$RestoreQuery = 
@"
    USE [master]; 
    ALTER DATABASE [$TargetDatabase] 
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
    RESTORE DATABASE [$TargetDatabase] FROM DISK = N'$DbBackupPath' WITH 
        FILE = 1,  
        MOVE N'$TargetDatabase' TO N'$DbDataFolder$TargetDatabase.mdf', 
        MOVE N'$($TargetDatabase)_log' TO N'$DbDataFolder$($TargetDatabase)_log.ldf', 
        NOUNLOAD, 
        REPLACE, 
        STATS = 5; 
    ALTER DATABASE [$TargetDatabase] SET MULTI_USER
"@

Write-Verbose $RestoreQuery -Verbose

invoke-sqlcmd -Query $RestoreQuery -ServerInstance $DbServerInstance -querytimeout 65535



Write-Verbose "Restoring $TargetDatabase database - End" -Verbose
}
