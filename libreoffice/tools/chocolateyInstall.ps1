try {
  if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{8EA569F1-97AF-4C3E-A0CB-4846C2D35A81}") {
    Write-ChocolateyFailure 'libreoffice' "Libre office is already installed!"
  }
  else {
    $downUrl = 'http://download.documentfoundation.org/libreoffice/stable/4.0.1/win/x86/LibreOffice_4.0.1_Win_x86.msi'
    # installer, will assert administrative rights
    Install-ChocolateyPackage 'libreoffice' 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
    # the following is all part of error handling
    Write-ChocolateySuccess 'libreoffice'
  }
} catch {
  Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  throw 
}