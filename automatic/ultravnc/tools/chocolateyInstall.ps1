try {
  $downUrl = '{{DownloadUrl}}'
  $down64Url = '{{DownloadUrlx64}}'

  # installer, will assert administrative rights
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/SILENT' "$downUrl" "$down64Url" -validExitCodes @(0)

  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}