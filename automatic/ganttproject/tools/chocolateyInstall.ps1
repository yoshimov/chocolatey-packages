#try {
  $url = '{{DownloadUrl}}'
  Install-ChocolateyPackage 'ganttproject' 'EXE' '/S' "$url" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'ganttproject'
#} catch {
  #Write-ChocolateyFailure 'ganttproject' "$($_.Exception.Message)"
  #throw 
#}