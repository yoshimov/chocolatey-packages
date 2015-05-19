$packageName = 'ultravnc'
$registryUninstallerKeyName = 'Ultravnc2_is1'
$installerType = 'EXE'
$silentArgs = '/SILENT'
$validExitCodes = @(0)
$file = (Get-ItemProperty -Path "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName").UninstallString
	
Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file