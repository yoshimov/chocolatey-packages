try {
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  Get-ChocolateyWebFile 'xyzzy' "$parentpath\xyzzy.lzh" 'http://www.jsdlab.co.jp/~kamei/cgi-bin/download.cgi'
  cmd /c "$parentpath\tools\extractlzh.bat"
#  Start-ChocolateyProcessAsAdmin "cd $parentpath; tools\lha32.exe x xyzzy.lzh" -validExitCodes @(0)
  Install-ChocolateyPath "$parentpath\xyzzy" 'User' # Machine will assert administrative rights

  $target = Join-Path $parentpath 'xyzzy\xyzzy.exe'
  Install-ChocolateyDesktopLink $target
  
  #Write-ChocolateySuccess 'xyzzy'
} catch {
  Write-ChocolateyFailure 'xyzzy' "$($_.Exception.Message)"
  throw 
}