$unpath = "${Env:ProgramFiles}\FreeFileSync\uninstall.exe"
Uninstall-ChocolateyPackage '{{PackageName}}' 'EXE' '/S' "$unpath" -validExitCodes @(0)
