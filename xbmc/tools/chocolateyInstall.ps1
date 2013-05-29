try {
  # installer, will assert administrative rights
  $downUrl = 'http://mirrors.xbmc.org/releases/win32/xbmc-12.2.exe'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyPackage 'xbmc' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess 'xbmc'
} catch {
  Write-ChocolateyFailure 'xbmc' "$($_.Exception.Message)"
  throw 
}