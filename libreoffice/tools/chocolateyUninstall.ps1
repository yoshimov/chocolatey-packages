try {
  # HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{1E85458A-9B00-443F-A187-2E06DBB15E43}
  $msid = '{1E85458A-9B00-443F-A187-2E06DBB15E43}'
  Uninstall-ChocolateyPackage 'libreoffice' 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'libreoffice'
} catch {
  Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  throw 
}
