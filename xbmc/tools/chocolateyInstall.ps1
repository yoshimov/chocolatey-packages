try {
  # installer, will assert administrative rights
  $downUrl = 'http://ftp.sunet.se/pub/multimedia/xbmc/releases/win32/xbmc-12.2.exe'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyPackage 'xbmc' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess 'xbmc'
} catch {
  Write-ChocolateyFailure 'xbmc' "$($_.Exception.Message)"
  throw 
}