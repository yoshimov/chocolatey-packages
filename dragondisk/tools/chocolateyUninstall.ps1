try {
  $unpath = "${Env:ProgramFiles}\Almageste\DragonDisk\unins000.exe"
  Uninstall-ChocolateyPackage 'dragondisk' 'EXE' '/SILENT' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'dragondisk'
} catch {
  Write-ChocolateyFailure 'dragondisk' "$($_.Exception.Message)"
  throw 
}
