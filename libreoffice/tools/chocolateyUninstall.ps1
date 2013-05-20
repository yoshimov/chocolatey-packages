try {
  $clsid='{F77ED0CD-2E5E-4FC7-82E0-BB7D461E739F}'
  Uninstall-ChocolateyPackage 'libreoffice' 'MSI' "$clsid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'libreoffice'
} catch {
  Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  throw 
}
