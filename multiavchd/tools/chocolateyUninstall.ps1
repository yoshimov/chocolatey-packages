try {
  $unpath = "${Env:SystemDrive}\multiAVCHD\uninstall.exe"
  Uninstall-ChocolateyPackage 'multiavchd' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'multiavchd'
} catch {
  Write-ChocolateyFailure 'multiavchd' "$($_.Exception.Message)"
  throw 
}
