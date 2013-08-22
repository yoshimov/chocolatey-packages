#try {
  $downUrl = '{{DownloadUrl}}'
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess '{{PackageName}}'
#} catch {
  #Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  #throw 
#}