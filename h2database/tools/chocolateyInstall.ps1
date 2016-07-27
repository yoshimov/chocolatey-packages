#try {
  $downUrl = 'http://www.h2database.com/h2-setup-2014-04-05.exe'
  Install-ChocolateyPackage 'h2database' 'EXE' '/S' "$downUrl" -validExitCodes @(0)

  #Write-ChocolateySuccess 'h2database'
#} catch {
  #Write-ChocolateyFailure 'h2database' "$($_.Exception.Message)"
  #throw 
#}
