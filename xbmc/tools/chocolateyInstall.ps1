try {
  # installer, will assert administrative rights
  $downUrl = 'http://mirror.optusnet.com.au/xbmc/releases/win32/xbmc-12.0.exe'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyPackage 'mediacoder' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess 'mediacoder'
} catch {
  Write-ChocolateyFailure 'mediacoder' "$($_.Exception.Message)"
  throw 
}