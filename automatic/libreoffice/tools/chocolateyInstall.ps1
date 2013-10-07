function Find-CID {
  param([String]$croot, [string]$cdname, [string]$ver)

  if (Test-Path $croot) {
    Get-ChildItem -Force -Path $croot | foreach {
      $CurrentKey = (Get-ItemProperty -Path $_.PsPath)
      if ($CurrentKey -match $cdname -and $CurrentKey -match $ver) {
        return $CurrentKey.PsChildName
      }
    }
  }
  return $null
}

$cname = '{{PackageName}}'
$version = '{{PackageVersion}}'

#try {
#  $clsid='{F1EE568A-171F-4C06-9BE6-2395BED067A3}'

  $uroot = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
  $uroot64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
  $msid = Find-CID $uroot "LibreOffice" "$version"
  if ($msid -eq $null) {
    # try 64bit registry
    $msid = Find-CID $uroot64 "LibreOffice" "$version"
  }
  if ($msid -ne $null) {
    Write-ChocolateyFailure $cname "LibreOffice is already installed!"
  } else {

   $downUrl = '{{DownloadUrl}}'
   # installer, will assert administrative rights
   Install-ChocolateyPackage '{{PackageName}}' 'MSI' '/passive' "$downUrl" -validExitCodes @(0)
   # the following is all part of error handling
   Write-ChocolateySuccess '{{PackageName}}'
  }
#} catch {
#  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
#  throw 
#}
