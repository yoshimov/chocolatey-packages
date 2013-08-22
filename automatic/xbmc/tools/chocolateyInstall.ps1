try {
  # installer, will assert administrative rights
  $downUrl = '{{DownloadUrl}}'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}