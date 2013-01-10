#try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{D682D879-C8F2-4A22-BEA6-07502F82FD56}
  $msid = '{D682D879-C8F2-4A22-BEA6-07502F82FD56}'
  Uninstall-ChocolateyPackage 'gsyncit' 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'gsyncit'
#} catch {
  #Write-ChocolateyFailure 'gsyncit' "$($_.Exception.Message)"
  #throw 
#}