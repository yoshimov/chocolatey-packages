try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  $downUrl = 'http://downloads.sourceforge.net/project/freemind/freemind/0.9.0/FreeMind-Windows-Installer-0.9.0-max.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Ffreemind%2Ffiles%2Ffreemind%2F0.9.0%2F&ts=1348108068&use_mirror=auto'
  Install-ChocolateyPackage 'freemind' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess 'freemind'
} catch {
  Write-ChocolateyFailure 'freemind' "$($_.Exception.Message)"
  throw 
}