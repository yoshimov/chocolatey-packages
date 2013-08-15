try {
  # installer, will assert administrative rights
  $downUrl = 'http://dl.mediacoderhq.com/files001/MediaCoder-0.8.25.5550.exe'
  $down64Url = 'http://dl.mediacoderhq.com/files001/MediaCoder-x64-0.8.25.5550.exe'
#  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyPackage 'mediacoder' 'EXE' '/S' "$downUrl" "$down64Url" -validExitCodes @(0)
  
  Write-ChocolateySuccess 'mediacoder'
} catch {
  Write-ChocolateyFailure 'mediacoder' "$($_.Exception.Message)"
  throw 
}