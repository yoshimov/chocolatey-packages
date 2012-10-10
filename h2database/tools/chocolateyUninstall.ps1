try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles(x86)}\H2\uninstall.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\H2\uninstall.exe"
  }
  Uninstall-ChocolateyPackage 'h2' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'h2'
} catch {
  Write-ChocolateyFailure 'h2' "$($_.Exception.Message)"
  throw 
}
