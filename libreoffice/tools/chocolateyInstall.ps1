﻿try {
  $clsid='{1062AD6C-80F4-4BC6-AB7C-A28892B497B8}'
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