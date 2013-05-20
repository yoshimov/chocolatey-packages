try {
  $clsid='{F77ED0CD-2E5E-4FC7-82E0-BB7D461E739F}'
  if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$clsid") {
    Write-ChocolateyFailure 'libreoffice' "Libre office is already installed!"
  }
  else {
    $downUrl = 'http://download.documentfoundation.org/libreoffice/stable/4.0.3/win/x86/LibreOffice_4.0.3_Win_x86.msi'
    # installer, will assert administrative rights
    Install-ChocolateyPackage 'libreoffice' 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
    # the following is all part of error handling
    Write-ChocolateySuccess 'libreoffice'
  }
} catch {
  Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  throw 
}