try {
  $downUrl = 'http://audacity.googlecode.com/files/audacity-win-2.0.3.exe'
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'audacity' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)

  # the following is all part of error handling
  Write-ChocolateySuccess 'audacity'
} catch {
  Write-ChocolateyFailure 'audacity' "$($_.Exception.Message)"
  throw 
}
