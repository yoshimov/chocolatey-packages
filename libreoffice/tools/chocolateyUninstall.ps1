try {
  $clsid='{1062AD6C-80F4-4BC6-AB7C-A28892B497B8}'
  Uninstall-ChocolateyPackage 'libreoffice' 'MSI' "$clsid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'libreoffice'
} catch {
  Write-ChocolateyFailure 'libreoffice' "$($_.Exception.Message)"
  throw 
}
