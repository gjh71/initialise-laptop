#Pre-requisite: Azure Powershell extensions (https://azure.microsoft.com/en-gb/documentation/articles/powershell-install-configure/)
#Developed using 

$params = @{
    storageAccountName = "itsdivstripdb" 
    storageAccountKey = "Wx5Rp/EzayvydomswcAu8m6ulktJRg4Ru8vmlYfU7ycELVP/6R8d/2KoCij2P8xEUS5BmtK3I+y49r3IpOBn3w=="
}
$storageContext = New-AzureStorageContext @params

$containerName = "div-stripdbs"
$packageDir = "C:\databases"

$params = @{
    Name = $containerName
    Context = $storageContext
}
$blobs = Get-AzureStorageBlob @params 
#$selectedBlobs = $blobs | Out-GridView -PassThru
#Write-Host $selectedBlobs

$selectedBlobs = $blobs | Out-GridView -OutputMode Multiple -title "Select (1 or more) stripped db for download"
write-host ("{0}, created on: {1} (Size: {2} )  was chosen" -f $selectBlob.Name, $selectBlob.LastModified, $selectBlob.Length)


foreach($selectBlob in $selectedBlobs)
{
    if (!(Test-Path $packageDir))
    {
        New-Item -Path $packageDir -ItemType Directory
    }
    else
    {
    
    }

    $params = @{
        Blob = $selectBlob.Name
        Destination = $packageDir
        Container = $containerName
        Context = $storageContext
    }
    Get-AzureStorageBlobContent @params

    $downloadedZip = Get-Item (Join-Path -path $packageDir -childpath $selectBlob.Name)

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory(($downloadedZip.FullName), (Join-Path -Path $packageDir -ChildPath $downloadedZip.BaseName))


    Remove-Item -Path $downloadedZip.FullName

    Write-Host ("Stripped database succesfully downloaded to: {0}" -f $packageDir) -ForegroundColor Green
}
if ($selectedBlobs -ne $null)
{
    Invoke-Item $packageDir
}

