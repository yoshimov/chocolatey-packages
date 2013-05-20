#try {
  $downUrl = 'http://www.sparxsystems.com/bin/EALite.exe'
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'ealite' 'EXE' '/passive' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'ealite'
#} catch {
  #Write-ChocolateyFailure 'ealite' "$($_.Exception.Message)"
  #throw 
#}