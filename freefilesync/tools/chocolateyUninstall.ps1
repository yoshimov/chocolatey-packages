try {
  $unpath = "${Env:ProgramFiles}\FreeFileSync\uninstall.exe"
  Uninstall-ChocolateyPackage 'freefilesync' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'freefilesync'
} catch {
  Write-ChocolateyFailure 'freefilesync' "$($_.Exception.Message)"
  throw 
}
