try {
  $clsid='{F8478020-D98E-49FB-BA14-07A534AED99C}'
  Uninstall-ChocolateyPackage '{{PackageName}}' 'MSI' "$clsid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}
