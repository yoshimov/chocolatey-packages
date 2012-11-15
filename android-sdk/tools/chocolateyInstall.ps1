#try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  $downUrl = 'http://dl.google.com/android/installer_r21-windows.exe'
  $md5hash = '29ca8cb8f0bc8db627fa2adc2139a3cc'
  Install-ChocolateyPackage 'android-sdk' 'EXE' '/S' "$downUrl" -validExitCodes @(0)

  #Write-ChocolateySuccess 'android-sdk'
#} catch {
  #Write-ChocolateyFailure 'android-sdk' "$($_.Exception.Message)"
  #throw 
#}