#try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  $insUrl='http://downloads.sourceforge.net/project/synkron/synkron/1.6.2/Synkron-1.6.2-win32.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsynkron%2Ffiles%2Fsynkron%2F1.6.2%2F&ts=1348144788&use_mirror=auto'
  Install-ChocolateyPackage 'synkron' 'EXE' '/SILENT' "$insUrl" -validExitCodes @(0)

  # the following is all part of error handling
  #Write-ChocolateySuccess 'synkron'
#} catch {
  #Write-ChocolateyFailure 'synkron' "$($_.Exception.Message)"
  #throw 
#}