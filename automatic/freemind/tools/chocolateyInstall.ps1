try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  $downUrl = 'http://sourceforge.net/projects/freemind/files/freemind/{{PackageVersion}}/FreeMind-Windows-Installer-{{PackageVersion}}-max.exe/download'
  Install-ChocolateyPackage '{{PackageName}}' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess '{{PackageName}}'
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}