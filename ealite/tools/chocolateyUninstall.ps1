try {
  $clsid='{53DF5B5A-9B29-474A-A738-868FD1CAC1D3}'
  Uninstall-ChocolateyPackage 'ealite' 'MSI' "$clsid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'ealite'
} catch {
  Write-ChocolateyFailure 'ealite' "$($_.Exception.Message)"
  throw 
}