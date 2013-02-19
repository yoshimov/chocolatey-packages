try {
  $down32Url='http://downloads.sourceforge.net/project/rapidminer/1.%20RapidMiner/5.3/rapidminer-5.3.005x32-install.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Frapidminer%2Ffiles%2F1.%2520RapidMiner%2F5.3%2F&use_mirror=auto'
  $down64Url='http://downloads.sourceforge.net/project/rapidminer/1.%20RapidMiner/5.3/rapidminer-5.3.005x64-install.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Frapidminer%2Ffiles%2F1.%2520RapidMiner%2F5.3%2F&use_mirror=auto'
  Install-ChocolateyPackage 'rapidminer' 'EXE' '/S' "$down32Url" "$down64Url"  -validExitCodes @(0)
  
  Write-ChocolateySuccess 'rapidminer'
} catch {
  Write-ChocolateyFailure 'rapidminer' "$($_.Exception.Message)"
  throw 
}
