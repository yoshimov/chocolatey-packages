try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles(x86)}\Justinmind\Prototyper Free 2.1.0\Uninstall.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\Justinmind\Prototyper Free 2.1.0\Uninstall.exe"
  }
  Uninstall-ChocolateyPackage 'prototyper' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'prototyper'
} catch {
  Write-ChocolateyFailure 'prototyper' "$($_.Exception.Message)"
  throw 
}
