$cname = '{{PackageName}}'
$ver = '{{PackageVersion}}'

#try {
  # installer, will assert administrative rights
  $downUrl = '{{DownloadUrl}}'
  Install-ChocolateyPackage $cname 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure $cname "$($_.Exception.Message)"
#  throw 
#}