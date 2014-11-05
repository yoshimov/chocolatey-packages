$cname = "{{PackageName}}"
$downUrl = "{{DownloadUrl}}"
$parentpath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage $cname $downUrl $parentPath
