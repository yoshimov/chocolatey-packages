try {
  $unpath = "${Env:LOCALAPPDATA}\Android\android-sdk\uninstall.exe"
  Uninstall-ChocolateyPackage 'android-sdk' 'EXE' '/S' "$unpath"
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'android-sdk'
} catch {
  Write-ChocolateyFailure 'android-sdk' "$($_.Exception.Message)"
  throw 
}
