#try {
  $downUrl = 'http://files.brothersoft.com/internet/download_managers/OrbitDownloaderSetup.exe'
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'orbit' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'orbit'
#} catch {
  #Write-ChocolateyFailure 'orbit' "$($_.Exception.Message)"
  #throw 
#}