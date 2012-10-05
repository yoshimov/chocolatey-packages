#try {
  $downUrl = 'http://d2ld3he4yll0xl.cloudfront.net/Prototyper_Free_Windows.exe'
  Install-ChocolateyPackage 'prototyper' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  #Write-ChocolateySuccess 'prototyper'
#} catch {
  #Write-ChocolateyFailure 'prototyper' "$($_.Exception.Message)"
  #throw 
#}