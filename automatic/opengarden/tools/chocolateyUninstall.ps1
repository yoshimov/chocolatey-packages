$cname = '{{PackageName}}'
$ver = '{{PackageVersion}}'

#try {
  $unpath = "${Env:APPDATA}\Open Garden\OpenGarden.exe"
  Uninstall-ChocolateyPackage $cname 'EXE' '/uninstall2' "$unpath" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure $cname "$($_.Exception.Message)"
#  throw 
#}
