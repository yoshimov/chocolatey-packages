#try {
  $downUrl = 'http://downloads.sourceforge.net/project/dvdstyler/dvdstyler/2.3.3/DVDStyler-2.3.3-win32.exe?r=http%3A%2F%2Fwww.dvdstyler.org%2Fen%2Fdownloads&ts=1352183911&use_mirror=auto'
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'dvdstyler' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)

  # the following is all part of error handling
  #Write-ChocolateySuccess 'dvdstyler'
#} catch {
  #Write-ChocolateyFailure 'dvdstyler' "$($_.Exception.Message)"
  #throw 
#}