try {
  # installer, will assert administrative rights
  $downUrl = '{{DownloadUrl}}'
  $down64Url = '{{DownloadUrlx64}}'
#  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/S' "$downUrl" "$down64Url" -validExitCodes @(0)
  
  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}