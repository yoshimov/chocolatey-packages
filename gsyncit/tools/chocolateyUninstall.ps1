#try {
  $msid = '{77B5D56B-3339-4171-B033-673DEF7A684C}'
  Uninstall-ChocolateyPackage 'gsyncit' 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'gsyncit'
#} catch {
  #Write-ChocolateyFailure 'gsyncit' "$($_.Exception.Message)"
  #throw 
#}