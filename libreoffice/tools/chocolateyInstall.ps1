#try {
  $downUrl = 'http://download.documentfoundation.org/libreoffice/stable/3.6.3/win/x86/LibO_3.6.3_Win_x86_install_multi.msi'
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'libreoffice' 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
  # the following is all part of error handling
  #Write-ChocolateySuccess 'libreoffice'
#} catch {
  #Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  #throw 
#}