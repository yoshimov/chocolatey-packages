try {
  $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $downUrl = 'http://mobalivecd.mobatek.net/en/MobaLiveCD_v2.1.exe'
  #Install-ChocolateyPackage 'mobalivecd' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)
  Get-ChocolateyWebFile 'mobalivecd' "${toolsDir}\MobaLiveCD_v2.1.exe" "$downUrl"
  Install-ChocolateyDesktopLink "${toolsDir}\MobaLiveCD_v2.1.exe"

  # the following is all part of error handling
  Write-ChocolateySuccess 'mobalivecd'
} catch {
  Write-ChocolateyFailure 'mobalivecd' "$($_.Exception.Message)"
  throw 
}
