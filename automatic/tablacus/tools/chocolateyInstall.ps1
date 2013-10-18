$cname = "{{PackageName}}"
#try {
  $downUrl = "{{DownloadUrl}}"
  $parentpath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Get-ChocolateyWebFile $cname "${parentpath}\{{PackageName}}.zip" "$downUrl"
  $cmd7z = "${Env:ProgramFiles}\7-Zip\7z.exe"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$parentpath" -ArgumentList "x -y ${parentpath}\{{PackageName}}.zip"

  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure $cname "$($_.Exception.Message)"
#  throw 
#}
