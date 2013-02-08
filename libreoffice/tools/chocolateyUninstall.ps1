try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{8EA569F1-97AF-4C3E-A0CB-4846C2D35A81}
  $msid = '{8EA569F1-97AF-4C3E-A0CB-4846C2D35A81}'
  Uninstall-ChocolateyPackage 'libreoffice' 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'libreoffice'
} catch {
  Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  throw 
}
