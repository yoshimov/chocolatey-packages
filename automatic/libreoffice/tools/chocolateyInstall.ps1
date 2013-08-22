try {
  $clsid='{F8478020-D98E-49FB-BA14-07A534AED99C}'
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