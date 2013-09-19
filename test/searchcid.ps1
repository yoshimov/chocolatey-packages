function Find-CID {
  param([String]$croot, [string]$cname, [String]$ver)

  Get-ChildItem -Force -Path $croot | foreach {
    $CurrentKey = (Get-ItemProperty -Path $_.PsPath)
    if ($CurrentKey -match $cname -and $CurrentKey -match $ver) {
      return $CurrentKey.PsChildName
    }
  }
  return $null
}

$uroot = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
#$uroot = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$cid = Find-CID $uroot "gSyncIt" "3.8.9"
write-host "cid =" $cid
