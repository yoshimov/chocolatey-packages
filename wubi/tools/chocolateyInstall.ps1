#try {
  Install-ChocolateyPackage 'wubi' 'EXE' '' 'http://www.ubuntu.com/start-download?distro=wubi&bits=32&release=desktop' -validExitCodes @(0)

  #Write-ChocolateySuccess 'wubi'
#} catch {
  #Write-ChocolateyFailure 'wubi' "$($_.Exception.Message)"
  #throw 
#}