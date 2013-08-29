﻿try {
  # This is the clsid for LibreOffice 4.1.1. Currently this clsid prevents from making an automatic package out of this.
  $clsid='{F1EE568A-171F-4C06-9BE6-2395BED067A3}'
  if ((Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$clsid") -or (Test-Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\$clsid")) {
    Write-Host "LibreOffice is already installed!"
  }
  else {
    $downUrl = '{{DownloadUrl}}'
    # installer, will assert administrative rights
    Install-ChocolateyPackage '{{PackageName}}' 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
    # the following is all part of error handling
    Write-ChocolateySuccess '{{PackageName}}'
  }
} catch {
  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
  throw 
}