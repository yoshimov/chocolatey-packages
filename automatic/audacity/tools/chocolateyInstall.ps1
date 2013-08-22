try {
  $downUrl = '{{DownloadUrl}}'
  # installer, will assert administrative rights
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)

  # the following is all part of error handling
  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}
