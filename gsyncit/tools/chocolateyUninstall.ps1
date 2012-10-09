#try {
  $msid = '{29EC0955-23AA-4B0B-8786-299F71C99387}'
  Uninstall-ChocolateyPackage 'gsyncit' 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'gsyncit'
#} catch {
  #Write-ChocolateyFailure 'gsyncit' "$($_.Exception.Message)"
  #throw 
#}