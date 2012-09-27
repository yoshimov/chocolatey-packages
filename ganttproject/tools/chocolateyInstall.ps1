#try {
  $url = 'http://ganttproject.googlecode.com/files/ganttproject-2.5.5-r1256.exe'
  Install-ChocolateyPackage 'ganttproject' 'EXE' '/S' "$url" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'ganttproject'
#} catch {
  #Write-ChocolateyFailure 'ganttproject' "$($_.Exception.Message)"
  #throw 
#}