$packageName = '{{PackageName}}'
$installerType = 'exe'
$installArgs = '/SILENT'
# {{DownloadUrlx64}} gets “misused” as filename for the installer here.
$url = 'http://sourceforge.net/projects/camstudio/files/stable/{{DownloadUrlx64}}/download'

Install-ChocolateyPackage $packageName $installerType $installArgs $url -validExitCodes @(0)