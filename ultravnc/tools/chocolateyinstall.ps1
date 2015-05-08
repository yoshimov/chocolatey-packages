$ErrorActionPreference = 'Stop';

$packageName = 'ultravnc' # arbitrary name for the package, used in messages
$registryUninstallerKeyName = 'ultravnc' #ensure this is the value in the registry
$installerType = 'EXE' #only one of these: exe, msi, msu
$url = 'http://www.uvnc.eu/download/1205/UltraVNC_1_2_05_X86_Setup.exe' # download url
$url64 = 'http://www.uvnc.eu/download/1205/UltraVNC_1_2_05_X64_Setup.exe' # 64bit URL here or remove - if installer decides, then use $url
$silentArgs = '/SILENT' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"