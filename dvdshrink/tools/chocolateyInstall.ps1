#try {
  $downUrl = 'http://fs40.filehippo.com/3519/86c4c175ec984d718dcde80f4f2cc4cc/dvdshrink32setup.exe'
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'dvdshrink' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)

  # the following is all part of error handling
  #Write-ChocolateySuccess 'dvdshrink'
#} catch {
  #Write-ChocolateyFailure 'dvdshrink' "$($_.Exception.Message)"
  #throw 
#}