$packageName = '{{PackageName}}'
$installerType = 'msi'
$url = '{{DownloadUrl}}'
$silentArgs = '/passive'

Install-ChocolateyPackage $packageName $installerType $silentArgs $url
