#try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{42226108-1887-4B4B-A8A4-D985D8679493}
  $msid = '{42226108-1887-4B4B-A8A4-D985D8679493}'
  Uninstall-ChocolateyPackage 'gsyncit' 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'gsyncit'
#} catch {
  #Write-ChocolateyFailure 'gsyncit' "$($_.Exception.Message)"
  #throw 
#}