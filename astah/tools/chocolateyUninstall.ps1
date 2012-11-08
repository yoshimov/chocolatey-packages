try {
  $unpath = "${Env:ProgramFiles}\astah-community\unins000.exe"
  Uninstall-ChocolateyPackage 'astah' 'EXE' '/SILENT' "$unpath"
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'astah'
} catch {
  Write-ChocolateyFailure 'astah' "$($_.Exception.Message)"
  throw 
}
