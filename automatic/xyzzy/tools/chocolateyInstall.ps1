$cname = "{{PackageName}}"
#try {
  $downUrl = "{{DownloadUrl}}"
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  Get-ChocolateyWebFile $cname "${parentpath}\xyzzy.zip" "$downUrl"
  $cmd7z = "${Env:ProgramFiles}\7-Zip\7z.exe"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$parentpath" -ArgumentList "x -y ${parentpath}\xyzzy.zip"
  Install-ChocolateyPath "$parentpath\xyzzy" 'User' # Machine will assert administrative rights

  $target = Join-Path $parentpath 'xyzzy\xyzzy.exe'
  Install-ChocolateyDesktopLink $target
  
  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure $cname "$($_.Exception.Message)"
#  throw 
#}
