$cname = '{{PackageName}}'
$version = '{{PackageVersion}}'

function Find-CID {
  param([String]$croot, [string]$cdname, [string]$ver)

  Get-ChildItem -Force -Path $croot | foreach {
    $CurrentKey = (Get-ItemProperty -Path $_.PsPath)
    if ($CurrentKey -match $cdname -and $CurrentKey -match $ver) {
      return $CurrentKey.PsChildName
    }
  }
  return $null
}

#try {
  $uroot = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
  $uroot64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
  $msid = Find-CID $uroot "gSyncIt" "$version"
  if ($msid -eq $null) {
    # try 64bit registry
    $msid = Find-CID $uroot64 "gSyncIt" "$version"
  }
  if ($msid -eq $null) {
    Write-ChocolateyFailure $cname "$cname is not found."
  }
  Uninstall-ChocolateyPackage $cname 'MSI' "$msid" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess $cname
#} catch {
#  Write-ChocolateyFailure $cname "$($_.Exception.Message)"
#  throw 
#}