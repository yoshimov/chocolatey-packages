$cname = '{{PackageName}}'
#try {
  $downUrl = '{{DownloadUrl}}'
  $toolsDir = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  Install-ChocolateyZipPackage $cname $downUrl $toolsDir
  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure 'hhkbcng' "$($_.Exception.Message)"
#  throw 
#}
