try {
  $downUrl = 'https://connortumbleson.com/apktool/googlecode/apktool1.5.2.tar.bz2'
  $downHelperUrl = 'https://connortumbleson.com/apktool/googlecode/apktool-install-windows-r05-ibot.tar.bz2'
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  
  Get-ChocolateyWebFile 'apktool' "${toolsDir}\apktool.tbz" "$downUrl"
  Get-ChocolateyWebFile 'apktool' "${toolsDir}\apktool-helper.tbz" "$downHelperUrl"
  $cmd7z = "${Env:ProgramFiles}\7-Zip\7z.exe"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$toolsDir" -ArgumentList "e ${toolsDir}\apktool.tbz"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$toolsDir" -ArgumentList "e ${toolsDir}\apktool.tar"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$toolsDir" -ArgumentList "e ${toolsDir}\apktool-helper.tbz"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$toolsDir" -ArgumentList "e ${toolsDir}\apktool-helper.tar"
  Install-ChocolateyPath "${toolsDir}" 'User'
  
  Write-ChocolateySuccess 'apktool'
} catch {
  Write-ChocolateyFailure 'apktool' "$($_.Exception.Message)"
  throw 
}
