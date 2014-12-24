  $downUrl = '{{DownloadUrl}}'
  # installer, will assert administrative rights
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/VERYSILENT /NORESTART' "$downUrl" -validExitCodes @(0)
