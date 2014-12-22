$downUrl = '{{DownloadUrl}}'
Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
