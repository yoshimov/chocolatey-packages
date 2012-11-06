try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles(x86)}\DVDStyler\unins000.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\DVDStyler\unins000.exe"
  }
  Uninstall-ChocolateyPackage 'dvdstyler' 'EXE' '/SILENT' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'dvdstyler'
} catch {
  Write-ChocolateyFailure 'dvdstyler' "$($_.Exception.Message)"
  throw 
}
