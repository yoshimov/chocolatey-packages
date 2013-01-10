try {
  $downUrl = "http://xyzzy-022.github.com/downloads/xyzzy-0.2.2.246.zip"
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  Get-ChocolateyWebFile 'xyzzy' "${parentpath}\xyzzy.zip" "$downUrl"
  $cmd7z = "${Env:ProgramFiles}\7-Zip\7z.exe"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$parentpath" -ArgumentList "x ${parentpath}\xyzzy.zip"
  Install-ChocolateyPath "$parentpath\xyzzy" 'User' # Machine will assert administrative rights

  $target = Join-Path $parentpath 'xyzzy\xyzzy.exe'
  Install-ChocolateyDesktopLink $target
  
  Write-ChocolateySuccess 'xyzzy'
} catch {
  Write-ChocolateyFailure 'xyzzy' "$($_.Exception.Message)"
  throw 
}
