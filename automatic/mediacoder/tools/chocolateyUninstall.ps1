try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles}\MediaCoder x64\uninst.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\MediaCoder\uninst.exe"
  }
  Uninstall-ChocolateyPackage 'mediacoder' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}
