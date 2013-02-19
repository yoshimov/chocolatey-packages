try {
  # installer, will assert administrative rights
  $downUrl = 'http://download.dragondisk.com/DragonDisk-1.05.exe'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyPackage 'dragondisk' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess 'dragondisk'
} catch {
  Write-ChocolateyFailure 'dragondisk' "$($_.Exception.Message)"
  throw 
}
