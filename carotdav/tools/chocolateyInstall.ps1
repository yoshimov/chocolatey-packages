try {
  $pkgid='carotdav'
  $downUrl = 'http://rei.to/CarotDAV1.9.9.portable.zip'
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  # installer, will assert administrative rights
  Install-ChocolateyZipPackage "$pkgid" "$downUrl" "$installDir"
  Write-ChocolateySuccess "$pkgid"
} catch {
  Write-ChocolateyFailure "$pkgid" "$($_.Exception.Message)"
  throw 
}