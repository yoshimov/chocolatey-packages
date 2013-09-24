$cname = '{{PackageName}}'
$version = '{{PackageVersion}}'
$dver = $version -replace "\.","_"
#try {
  $downUrl = "http://www.fieldstonsoftware.com/software/gsyncit3/downloads/gSyncit_${dver}.msi"
  $down64Url = "http://www.fieldstonsoftware.com/software/gsyncit3/downloads/gSyncit64_${dver}.msi"
  Install-ChocolateyPackage $cname 'MSI' '/passive' "$downUrl" "$down64Url"
  
  # the following is all part of error handling
  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure $cname "$($_.Exception.Message)"
#  throw 
#}
