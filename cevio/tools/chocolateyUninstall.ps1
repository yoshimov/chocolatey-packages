try {
  $pkgid='cevio'
  $clsid='{0CF8F7F2-7801-482F-9AB5-F3800F410972}'
  Uninstall-ChocolateyPackage "$pkgid" 'MSI' "$clsid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess "$pkgid"
} catch {
  Write-ChocolateyFailure "$pkgid" "$($_.Exception.Message)"
  throw 
}
