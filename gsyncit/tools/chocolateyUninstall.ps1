try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{3FC731BD-3C3E-4A2D-9252-024F35E4C396}
  $msid = '{3FC731BD-3C3E-4A2D-9252-024F35E4C396}
  Uninstall-ChocolateyPackage 'gsyncit' 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'gsyncit'
} catch {
  Write-ChocolateyFailure 'gsyncit' "$($_.Exception.Message)"
  throw 
}