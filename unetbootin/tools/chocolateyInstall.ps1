try {
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $downUrl = 'http://sourceforge.net/projects/unetbootin/files/UNetbootin/584/unetbootin-windows-584.exe/download'
  Get-ChocolateyWebFile 'unetbootin' "${toolsDir}\Unetbootin.exe" "$downUrl"
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'unetbootin'
} catch {
  Write-ChocolateyFailure 'unetbootin' "$($_.Exception.Message)"
  throw 
}
