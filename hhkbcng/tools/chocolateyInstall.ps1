try {
  $downUrl = 'http://www.pfu.fujitsu.com/hhkeyboard/downloads/HHKBCNG_V1_0.exe'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Get-ChocolateyWebFile 'hhkbcng' "${toolsDir}\HHKBCNG_V1_0.exe" "$downUrl"
  Start-Process "${toolsDir}\HHKBCNG_V1_0.exe" -WorkingDirectory "$toolsDir"
  Write-ChocolateySuccess 'hhkbcng'
} catch {
  Write-ChocolateyFailure 'hhkbcng' "$($_.Exception.Message)"
  throw 
}