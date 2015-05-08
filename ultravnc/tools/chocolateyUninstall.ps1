#try {
#  $unpath = "${Env:ProgramFiles}\UltraVNC\unins000.exe"
#  Uninstall-ChocolateyPackage 'ultravnc' 'EXE' '/SILENT' "$unpath" -validExitCodes @(0)
  
  
  #NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one

# stop on all errors
$ErrorActionPreference = 'Stop';

# Auto Uninstaller should be able to detect and handle registry uninstalls (if it is turned on, it is in preview for 0.9.9).

$packageName = 'ultravnc'
$registryUninstallerKeyName = 'Ultravnc2_is1' #ensure this is the value in the registry
$installerType = 'EXE'
$silentArgs = '/SILENT'
$validExitCodes = @(0)

$osBitness = Get-ProcessorBits
 
#if ($osBitness -eq 64) {
#  $file = (Get-ItemProperty -Path "hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName").UninstallString
#} else {
  $file = (Get-ItemProperty -Path "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$registryUninstallerKeyName").UninstallString
#} 
	
Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file