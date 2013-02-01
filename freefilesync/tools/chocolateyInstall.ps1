try {
  $downUrl = 'http://downloads.sourceforge.net/project/freefilesync/freefilesync/v5.11/FreeFileSync_5.11_setup.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Ffreefilesync%2F%3Fsource%3Ddlp&use_mirror=auto'
  Install-ChocolateyPackage 'freefilesync' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'freefilesync'
} catch {
  Write-ChocolateyFailure 'freefilesync' "$($_.Exception.Message)"
  throw 
}