#try {
#  $downUrl = '{{DownloadUrl}}'
  $downUrl = 'http://sourceforge.net/projects/freefilesync/files/FreeFileSync/{{PackageVersion}}/FreeFileSync_{{PackageVersion}}_Windows_Setup.exe/download'
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
#  Write-ChocolateySuccess '{{PackageName}}'
#} catch {
#  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
#  throw 
#}