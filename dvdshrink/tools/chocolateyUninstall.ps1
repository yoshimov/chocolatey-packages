try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles(x86)}\DVD Shrink\unins000.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\DVD Shrink\unins000.exe"
  }
  Uninstall-ChocolateyPackage 'dvdshrink' 'EXE' '/SILENT' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'dvdshrink'
} catch {
  Write-ChocolateyFailure 'dvdshrink' "$($_.Exception.Message)"
  throw 
}
