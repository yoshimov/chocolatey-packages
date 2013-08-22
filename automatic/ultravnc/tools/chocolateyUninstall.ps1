try {
  $unpath = "${Env:ProgramFiles}\UltraVNC\unins000.exe"
  Uninstall-ChocolateyPackage '{{PackageName}}' 'EXE' '/SILENT' "$unpath" -validExitCodes @(0)

  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}