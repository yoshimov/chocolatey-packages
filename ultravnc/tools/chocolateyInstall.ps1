try {
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $url = 'http://www.uvnc.com/component/jdownloads/summary/4/45.html';
  } else {
    $url = 'http://www.uvnc.com/component/jdownloads/summary/4/44.html'
  |

  # obtain direct download link.

  # installer, will assert administrative rights
  Install-ChocolateyPackage 'ultravnc' 'EXE_OR_MSI' 'SILENT_ARGS' 'URL' -validExitCodes @(0)
  # download and unpack a zip file
  Install-ChocolateyZipPackage 'ultravnc' 'URL' "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" '64BIT_URL_DELETE_IF_NO_64BIT' 
  
  # other helpers - using any of these means you want to uncomment the error handling up top and at bottom.
  # downloader that the main helpers use to download items
  #Get-ChocolateyWebFile 'ultravnc' 'DOWNLOAD_TO_FILE_FULL_PATH' 'URL' '64BIT_URL_DELETE_IF_NO_64BIT'
  # installer, will assert administrative rights - used by Install-ChocolateyPackage
  #Install-ChocolateyInstallPackage 'ultravnc' 'EXE_OR_MSI' 'SILENT_ARGS' '_FULLFILEPATH_' -validExitCodes @(0)
  # unzips a file to the specified location - auto overwrites existing content
  #Get-ChocolateyUnzip "FULL_LOCATION_TO_ZIP.zip" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  # Runs processes asserting UAC, will assert administrative rights - used by Install-ChocolateyInstallPackage
  #Start-ChocolateyProcessAsAdmin 'STATEMENTS_TO_RUN' 'Optional_Application_If_Not_PowerShell' -validExitCodes @(0)
  # add specific folders to the path - any executables found in the chocolatey package folder will already be on the path. This is used in addition to that or for cases when a native installer doesn't add things to the path.
  #Install-ChocolateyPath 'LOCATION_TO_ADD_TO_PATH' 'User_OR_Machine' # Machine will assert administrative rights
  # add specific files as shortcuts to the desktop
  #$target = Join-Path $MyInvocation.MyCommand.Definition 'ultravnc.exe'
  #Install-ChocolateyDesktopLink $target
  
  #------- ADDITIONAL SETUP -------#
  # make sure to uncomment the error handling if you have additional setup to do

  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'ultravnc'
#} catch {
  #Write-ChocolateyFailure 'ultravnc' "$($_.Exception.Message)"
  #throw 
#}