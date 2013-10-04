$cname = 'getter1'
#try {
  $downUrl = 'http://solidbluesky.com/files/Getter1_win_42.zip'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyZipPackage $cname $downUrl $toolsDir
  Move-Item "${toolsDir}\Getter1_win_42\Getter1\*" "${toolsDir}\"
  Remove-Item "${toolsDir}\Getter1_win_42" -Recurse -Force
  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure 'hhkbcng' "$($_.Exception.Message)"
#  throw 
#}
