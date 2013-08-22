try {
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  # {{DownloadUrlx64}} gets “misused” here as version without dots.
  $downUrl = 'http://sourceforge.net/projects/unetbootin/files/UNetbootin/{{DownloadUrlx64}}/unetbootin-windows-{{DownloadUrlx64}}.exe/download'
  Get-ChocolateyWebFile '{{PackageName}}' "${toolsDir}\Unetbootin.exe" "$downUrl"
  
  # the following is all part of error handling
  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}
