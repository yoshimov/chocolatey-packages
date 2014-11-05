$cname = "{{PackageName}}"
$downUrl = "{{DownloadUrl}}"
$binroot = Get-BinRoot
$installdir = "${binroot}\gitblit"
Install-ChocolateyZipPackage $cname "$downUrl" "$installdir"
