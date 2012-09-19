try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  # main helpers - these have error handling tucked into them so they become the only line of your script if that is all you need.
  # installer, will assert administrative rights
#  Install-ChocolateyPackage 'texlive' 'EXE_OR_MSI' 'SILENT_ARGS' 'URL' '64BIT_URL_DELETE_IF_NO_64BIT'  -validExitCodes @(0)
  # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
  #Exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
  # download and unpack a zip file
#  Install-ChocolateyZipPackage 'texlive' 'http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/install-tl.zip' "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  
  # other helpers - using any of these means you want to uncomment the error handling up top and at bottom.
  # downloader that the main helpers use to download items
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  $zipfile = "$parentpath\texlive.zip"
  Get-ChocolateyWebFile 'texlive' $zipfile 'http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/install-tl.zip'
  # installer, will assert administrative rights - used by Install-ChocolateyPackage
  #Install-ChocolateyInstallPackage 'texlive' 'EXE_OR_MSI' 'SILENT_ARGS' '_FULLFILEPATH_' -validExitCodes @(0)
  # unzips a file to the specified location - auto overwrites existing content
  Get-ChocolateyUnzip $zipfile "$parentpath"
  # Runs processes asserting UAC, will assert administrative rights - used by Install-ChocolateyInstallPackage
  # set proxy
  $rpath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
  $proxyitem = Get-ItemProperty $rpath
  $proxys = $proxyitem.ProxyServer
  #$wgetrcfile = "$parentpath\install-tl-20120919\tlpkg\installer\wget\.wgetrc"
  cmd /c "$parentpath\tools\proxyinstall.bat $parentpath\tools\texlive.profile $proxys"
#  Start-ChocolateyProcessAsAdmin "$parentpath\install-tl-20120919\install-tl.bat -q --no-persistent-downloads -profile $parentpath\tools\texlive.profile" -validExitCodes @(0)
  # add specific folders to the path - any executables found in the chocolatey package folder will already be on the path. This is used in addition to that or for cases when a native installer doesn't add things to the path.
  #Install-ChocolateyPath 'LOCATION_TO_ADD_TO_PATH' 'User_OR_Machine' # Machine will assert administrative rights
  # add specific files as shortcuts to the desktop
  #$target = Join-Path $MyInvocation.MyCommand.Definition 'texlive.exe'
  #Install-ChocolateyDesktopLink $target
  
  #------- ADDITIONAL SETUP -------#
  # make sure to uncomment the error handling if you have additional setup to do

  #$processor = Get-WmiObject Win32_Processor
  #$is64bit = $processor.AddressWidth -eq 64

  
  # the following is all part of error handling
  Write-ChocolateySuccess 'texlive'
} catch {
  Write-ChocolateyFailure 'texlive' "$($_.Exception.Message)"
  #throw 
}
