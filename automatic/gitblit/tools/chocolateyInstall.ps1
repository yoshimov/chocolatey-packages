$cname = "{{PackageName}}"
#try {
  $downUrl = "{{DownloadUrl}}"
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  $binroot = "${Env:SystemDrive}\${Env:chocolatey_bin_root}"
  $installdir = "${binroot}\gitblit"
  $cmd7z = "${Env:ProgramFiles}\7-Zip\7z.exe"
  New-Item -ItemType dir -Force "$installdir"
  Get-ChocolateyWebFile $cname "${parentpath}\gitblit.zip" "$downUrl"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$installdir" -ArgumentList "x -y ${parentpath}\gitblit.zip"
  Install-ChocolateyPath "${installdir}\gitblit" 'User'

  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure $cname "$($_.Exception.Message)"
#  throw 
#}
