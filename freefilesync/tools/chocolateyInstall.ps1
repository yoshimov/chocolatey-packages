try {
  $downUrl = 'http://sourceforge.net/projects/freefilesync/files/freefilesync/v5.18/FreeFileSync_5.18_Windows_Setup.exe/download'
  Install-ChocolateyPackage 'freefilesync' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'freefilesync'
} catch {
  Write-ChocolateyFailure 'freefilesync' "$($_.Exception.Message)"
  throw 
}