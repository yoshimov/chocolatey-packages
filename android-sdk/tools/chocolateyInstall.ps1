#try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  Install-ChocolateyPackage 'android-sdk' 'EXE' '/S' 'http://dl.google.com/android/installer_r20.0.3-windows.exe' -validExitCodes @(0)

  #Write-ChocolateySuccess 'android-sdk'
#} catch {
  #Write-ChocolateyFailure 'android-sdk' "$($_.Exception.Message)"
  #throw 
#}