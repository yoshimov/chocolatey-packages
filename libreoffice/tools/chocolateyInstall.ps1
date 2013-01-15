#try {
  if (Test-Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{60B2F25C-22CB-4CD9-9168-8C63708DC1A1}") {
    Write-Host "Libre office is already installed!"
  }
  else {
    $downUrl = 'http://download.documentfoundation.org/libreoffice/stable/3.6.4/win/x86/LibO_3.6.4_Win_x86_install_multi.msi'
    # installer, will assert administrative rights
    Install-ChocolateyPackage 'libreoffice' 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
    # the following is all part of error handling
    #Write-ChocolateySuccess 'libreoffice'
  }
#} catch {
  #Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  #throw 
#}