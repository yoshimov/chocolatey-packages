try {
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $downUrl = 'http://downloads.sourceforge.net/project/unetbootin/UNetbootin/581/unetbootin-windows-581.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Funetbootin%2Ffiles%2FUNetbootin%2F581%2F&ts=1349072989&use_mirror=auto'
  Get-ChocolateyWebFile 'unetbootin' "${toolsDir}\Unetbootin.exe" "$downUrl"
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'unetbootin'
} catch {
  Write-ChocolateyFailure 'unetbootin' "$($_.Exception.Message)"
  throw 
}
