try {
  $unpath = "${Env:ProgramFiles}\FreeFileSync\uninstall.exe"
  Uninstall-ChocolateyPackage '{{PackageName}}' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}
