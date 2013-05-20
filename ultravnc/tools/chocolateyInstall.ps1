try {
  $downUrl = 'http://www.uvnc.eu/download/1190/UltraVNC_1_1_9_X86_Setup.exe'
  $down64Url = 'http://www.uvnc.eu/download/1190/UltraVNC_1_1_9_X64_Setup.exe'

  # installer, will assert administrative rights
  Install-ChocolateyPackage 'ultravnc' 'EXE' '/SILENT' "$downUrl" "$down64Url" -validExitCodes @(0)

  Write-ChocolateySuccess 'ultravnc'
} catch {
  Write-ChocolateyFailure 'ultravnc' "$($_.Exception.Message)"
  throw 
}