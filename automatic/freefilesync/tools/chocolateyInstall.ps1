#try {
  $downUrl = '{{DownloadUrl}}'
#  $downUrl = 'http://downloads.sourceforge.net/project/freefilesync/FreeFileSync/{{PackageVersion}}/FreeFileSync_{{PackageVersion}}_Windows_Setup.exe?r=&ts=&use_mirror=auto'
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
#  Write-ChocolateySuccess '{{PackageName}}'
#} catch {
#  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
#  throw 
#}