try {
  $clsid='{FE88323B-9F0E-4596-8F56-37757C6918E9}'
  Uninstall-ChocolateyPackage 'libreoffice' 'MSI' "$clsid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'libreoffice'
} catch {
  Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  throw 
}
