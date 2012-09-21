try {
  # download and unpack a zip file
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyZipPackage 'wink' 'http://files.snapfiles.com/localdl936/wink20-1060.zip' "$toolsDir"
  
  # Runs processes asserting UAC, will assert administrative rights - used by Install-ChocolateyInstallPackage
  Start-ChocolateyProcessAsAdmin "$toolsDir\wink20.exe /S" -validExitCodes @(0)
  
  Write-ChocolateySuccess 'wink'
} catch {
  Write-ChocolateyFailure 'wink' "$($_.Exception.Message)"
  throw 
}