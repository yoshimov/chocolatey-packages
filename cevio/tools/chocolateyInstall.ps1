try {
  $pkgid='cevio'
  $clsid='{7B13DAA4-2DE5-4D26-B9FB-1C5FAB19E662}'
  if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$clsid") {
    Write-ChocolateyFailure "$pkgid" "CeVIO Creative Studio is already installed!"
  }
  else {
    $downUrl = 'http://cevio.jp/download/CeVIO_Creative_Studio_FREE_Setup_(1.2.4.2).msi'
    # installer, will assert administrative rights
    Install-ChocolateyPackage "$pkgid" 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
    # the following is all part of error handling
    Write-ChocolateySuccess "$pkgid"
  }
} catch {
  Write-ChocolateyFailure "$pkgid" "$($_.Exception.Message)"
  throw 
}