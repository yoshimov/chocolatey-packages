#try {
  $downUrl = '{{DownloadUrl}}'
  Install-ChocolateyPackage 'prototyper' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  #Write-ChocolateySuccess 'prototyper'
#} catch {
  #Write-ChocolateyFailure 'prototyper' "$($_.Exception.Message)"
  #throw 
#}