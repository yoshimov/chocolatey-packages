try {
  # installer, will assert administrative rights
  $downUrl = 'http://mc.rengaosh.com/dl/_files/MediaCoder-0.8.15.5280.zip'
  $down64Url = 'http://mc.rengaosh.com/dl/_files/MediaCoder-x64-0.8.15.5280.zip'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyZipPackage 'mediacoder' "$downUrl" "$toolsDir" "$down64Url" 
  
  Rename-Item "$toolsDir\MediaCoder-0.8.15.5280.exe" "mediacoder.exe" -Force
  Rename-Item "$toolsDir\MediaCoder-x64-0.8.15.5280.exe" "mediacoder.exe" -Force
  Start-ChocolateyProcessAsAdmin "$toolsDir\mediacoder.exe" -validExitCodes @(0)

  Write-ChocolateySuccess 'mediacoder'
} catch {
  Write-ChocolateyFailure 'mediacoder' "$($_.Exception.Message)"
  throw 
}