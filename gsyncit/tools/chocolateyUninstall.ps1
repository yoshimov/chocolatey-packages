try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{B91569AF-DED4-467F-ADF0-A02501839CD0}
  $msid = '{B91569AF-DED4-467F-ADF0-A02501839CD0}'
  Uninstall-ChocolateyPackage 'gsyncit' 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'gsyncit'
} catch {
  Write-ChocolateyFailure 'gsyncit' "$($_.Exception.Message)"
  throw 
}