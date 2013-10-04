$packageName = '{{PackageName}}'
$installerType = 'exe'
$installArgs = '/S'
# {{DownloadUrlx64}} gets “misused” as filename and parent folder for the installer here.
$url = 'http://sourceforge.net/projects/dia-installer/files/dia-win32-installer/{{DownloadUrlx64}}/download'

Install-ChocolateyPackage $packageName $installerType $installArgs $url -validExitCodes @(0)