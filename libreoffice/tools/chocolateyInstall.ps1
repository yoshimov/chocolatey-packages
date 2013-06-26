try {
  $clsid='{FE88323B-9F0E-4596-8F56-37757C6918E9}'
  if ((Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$clsid") -or (Test-Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$clsid")) {
    Write-Host "LibreOffice is already installed!"
  }
  else {
    $downUrl = 'http://download.documentfoundation.org/libreoffice/stable/4.0.4/win/x86/LibreOffice_4.0.4_Win_x86.msi'
    # installer, will assert administrative rights
    Install-ChocolateyPackage 'libreoffice' 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
    # the following is all part of error handling
    Write-ChocolateySuccess 'libreoffice'
  }
} catch {
  Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  throw 
}