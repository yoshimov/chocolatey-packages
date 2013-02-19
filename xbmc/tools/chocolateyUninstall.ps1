try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles(x86)}\xbmc\uninstall.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\xbmc\uninstall.exe"
  }
  Uninstall-ChocolateyPackage 'xbmc' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'xbmc'
} catch {
  Write-ChocolateyFailure 'xbmc' "$($_.Exception.Message)"
  throw 
}
