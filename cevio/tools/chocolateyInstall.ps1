try {
  $pkgid='cevio'
  $clsid='{0CF8F7F2-7801-482F-9AB5-F3800F410972}'
  if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$clsid") {
    Write-ChocolateyFailure "$pkgid" "CeVIO Creative Studio is already installed!"
  }
  else {
    $downUrl = 'http://cevio.jp/download/CeVIO_Creative_Studio_FREE_Setup_(1.0.0.1).msi'
    # installer, will assert administrative rights
    Install-ChocolateyPackage "$pkgid" 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
    # the following is all part of error handling
    Write-ChocolateySuccess "$pkgid"
  }
} catch {
  Write-ChocolateyFailure "$pkgid" "$($_.Exception.Message)"
  throw 
}