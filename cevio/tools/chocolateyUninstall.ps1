try {
  $pkgid='cevio'
  $clsid='{7B13DAA4-2DE5-4D26-B9FB-1C5FAB19E662}'
  Uninstall-ChocolateyPackage "$pkgid" 'MSI' "$clsid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess "$pkgid"
} catch {
  Write-ChocolateyFailure "$pkgid" "$($_.Exception.Message)"
  throw 
}
