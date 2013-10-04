$packageName = '{{PackageName}}'
$installerType = 'exe'
$installArgs = '/SILENT'
# {{DownloadUrlx64}} gets “misused” here as the real software version.
$url = 'http://sourceforge.net/projects/synkron/files/synkron/{{DownloadUrlx64}}/Synkron-{{DownloadUrlx64}}-win32.exe/download'

Install-ChocolateyPackage $packageName $installerType $installArgs $url -validExitCodes @(0)