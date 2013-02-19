try {
  $downUrl = 'http://downloads.sourceforge.net/project/freefilesync/freefilesync/v5.12/FreeFileSync_5.12_setup.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Ffreefilesync%2Ffiles%2Ffreefilesync%2Fv5.12%2F&use_mirror=auto'
  Install-ChocolateyPackage 'freefilesync' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'freefilesync'
} catch {
  Write-ChocolateyFailure 'freefilesync' "$($_.Exception.Message)"
  throw 
}