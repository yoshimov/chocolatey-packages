$pkgid='carotdav'
$downUrl = 'http://rei.to/CarotDAV1.15.2.portable.zip'
$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
$checksumType = "SHA1"
$checkSum = "f140684ea59f41755f2f9a9007bc99f41d367587"
# installer, will assert administrative rights
Install-ChocolateyZipPackage "$pkgid" "$downUrl" "$installDir" -ChecksumType $checksumType -Checksum $checkSum
Install-ChocolateyDesktopLink (Join-Path $installDir 'CarotDAV\CarotDAV.exe')
Install-ChocolateyDesktopLink (Join-Path $installDir 'CarotDAV\CarotDAVC.exe')