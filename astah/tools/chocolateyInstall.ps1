try {
  # obtain download id from web page
  [void]([Reflection.Assembly]::LoadWithPartialName("System.Web"))
  $word = [Web.HttpUtility]::UrlEncode($word)
  $processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $url = 'http://members.change-vision.com/files/astah_community/6_6_4/astah-community-6_6_4-41775-jre-64bit-setup.exe'
  } else {
    $url = 'http://members.change-vision.com/files/astah_community/6_6_4/astah-community-6_6_4-41775-jre-setup.exe'
  }
  $content = Get-WebFile "$url" -Passthru

  if($content -match '<a href="(/files/([0-9A-Za-z_\-]+)/astah_community/.+exe;jsessionid=[0-9A-Z]+)"')
  {
     $did = "$($matches[1])"
  }

  $downUrl = "http://members.change-vision.com${did}"
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  Install-ChocolateyPackage 'astah' 'EXE' '/SILENT' "$downUrl" -validExitCodes @(0)
  
  Write-ChocolateySuccess 'astah'
} catch {
  Write-ChocolateyFailure 'astah' "$($_.Exception.Message)"
  throw 
}