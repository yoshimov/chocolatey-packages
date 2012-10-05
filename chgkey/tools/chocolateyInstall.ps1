try {
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $downUrl = 'http://satoshi.web5.jp/f_soft/dw_win.files/ChgKey15.LZH'
  Get-ChocolateyWebFile 'chgkey' "${toolsDir}\chgkey.lzh" "$downUrl"

  $cmd7zip = "${Env:ProgramFiles}\7-zip\7z.exe"
  Start-Process -WorkingDirectory "$toolsDir" -FilePath "$cmd7zip" -ArgumentList "x","chgkey.lzh"

  #$target = Join-Path $toolsDir 'ChgKey.exe'
  #Install-ChocolateyDesktopLink $target
  
  Write-ChocolateySuccess 'chgkey'
} catch {
  Write-ChocolateyFailure 'chgkey' "$($_.Exception.Message)"
  throw 
}