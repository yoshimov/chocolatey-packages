#try {
  $downUrl = 'http://www.fieldstonsoftware.com/software/gsyncit3/downloads/gSyncit_3_6_41.msi'
  $down64Url = 'http://www.fieldstonsoftware.com/software/gsyncit3/downloads/gSyncit64_3_6_41.msi'
  Install-ChocolateyPackage 'gsyncit' 'MSI' '/passive' "$downUrl" "$down64Url" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'gsyncit'
#} catch {
  #Write-ChocolateyFailure 'gsyncit' "$($_.Exception.Message)"
  #throw 
#}