$packageName = 'ultravnc'
$registryUninstallerKeyName = 'ultravnc'
$installerType = 'EXE'
$url = 'http://www.uvnc.eu/download/1205/UltraVNC_1_2_05_X86_Setup.exe'
$url64 = 'http://www.uvnc.eu/download/1205/UltraVNC_1_2_05_X64_Setup.exe'
$silentArgs = '/SILENT'
$validExitCodes = @(0)
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"