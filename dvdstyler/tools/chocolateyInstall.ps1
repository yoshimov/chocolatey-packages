#try {
  $downUrl = 'http://downloads.sourceforge.net/project/dvdstyler/dvdstyler/2.7.2/DVDStyler-2.7.2-win32.exe?use_mirror=auto'
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'dvdstyler' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)

  # the following is all part of error handling
  #Write-ChocolateySuccess 'dvdstyler'
#} catch {
  #Write-ChocolateyFailure 'dvdstyler' "$($_.Exception.Message)"
  #throw 
#}