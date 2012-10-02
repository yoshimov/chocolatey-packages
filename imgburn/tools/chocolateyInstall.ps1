#try {
  $downUrl = 'http://download.imgburn.com/SetupImgBurn_2.5.7.0.exe'
  Install-ChocolateyPackage 'imgburn' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
  #Write-ChocolateySuccess 'imgburn'
#} catch {
  #Write-ChocolateyFailure 'imgburn' "$($_.Exception.Message)"
  #throw 
#}