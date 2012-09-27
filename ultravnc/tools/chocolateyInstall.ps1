try {
  $downUrl = 'http://support1.uvnc.com/download/10962/UltraVNC_1.0.9.6.2_Setup.exe'
  $down64Url = 'http://support1.uvnc.com/download/10962/UltraVNC_1.0.9.6.2_x64_Setup.exe'

  # installer, will assert administrative rights
  Install-ChocolateyPackage 'ultravnc' 'EXE' '/SILENT' "$downUrl" "$down64Url" -validExitCodes @(0)

  Write-ChocolateySuccess 'ultravnc'
} catch {
  Write-ChocolateyFailure 'ultravnc' "$($_.Exception.Message)"
  throw 
}