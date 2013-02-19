try {
  $unpath = "${Env:ProgramFiles}\Rapid-I\RapidMiner5\uninstall.exe"
  Uninstall-ChocolateyPackage 'rapidminer' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'rapidminer'
} catch {
  Write-ChocolateyFailure 'rapidminer' "$($_.Exception.Message)"
  throw 
}
