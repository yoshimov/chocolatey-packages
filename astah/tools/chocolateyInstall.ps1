#try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  Install-ChocolateyZipPackage 'astah' 'http://members.change-vision.com/files/_VIQk3oi8TeFfKD5xBG5FutLTSitwWAsM/astah_community/6_6_3/astah-community-6_6_3.zip' "$parentpath" 
  
  $target = Join-Path $parentpath 'astah_community\astah-com.exe'
  Install-ChocolateyDesktopLink $target
  
  #Write-ChocolateySuccess 'astah'
#} catch {
  #Write-ChocolateyFailure 'astah' "$($_.Exception.Message)"
  #throw 
#}