$packageName = '{{PackageName}}'
$installerType = 'exe'
$installArgs = '/SILENT'
# {{DownloadUrlx64}} gets “misused” as filename for the installer here.
$url = '{{DownloadUrl}}'

Install-ChocolateyPackage $packageName $installerType $installArgs $url -validExitCodes @(0)