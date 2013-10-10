try {
  $packageName = '{{PackageName}}'
  $unpath = "${Env:LOCALAPPDATA}\Android\android-sdk\uninstall.exe"
  Uninstall-ChocolateyPackage $packageName 'exe' '/S' $unpath
  
  # the following is all part of error handling
  Write-ChocolateySuccess $packageName
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw 
}
