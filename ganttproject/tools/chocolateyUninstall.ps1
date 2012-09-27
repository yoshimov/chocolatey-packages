try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $unpath = "${Env:ProgramFiles(x86)}\GanttProject-2.5\uninstall.exe"
  } else {
    $unpath = "${Env:ProgramFiles}\GanttProject-2.5\uninstall.exe"
  }

  Uninstall-ChocolateyPackage 'ganttproject' 'EXE' '/S' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'ganttproject'
} catch {
  Write-ChocolateyFailure 'ganttproject' "$($_.Exception.Message)"
  throw 
}