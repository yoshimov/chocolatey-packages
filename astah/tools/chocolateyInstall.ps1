try {
  # obtain download id from web page
  [void]([Reflection.Assembly]::LoadWithPartialName("System.Web"))
  $word = [Web.HttpUtility]::UrlEncode($word)
  $url = 'http://members.change-vision.com/files/astah_community/6_6_3/astah-community-6_6_3.zip'
  $webReq = [Net.HttpWebRequest]::Create("$url")
  $webReq.Method = "GET"

  $webRes = $webReq.GetResponse()
  $sr = New-Object IO.StreamReader($webRes.GetResponseStream(), $webRes.ContentEncoding)
  $content = $sr.ReadToEnd()
  $sr.Close()
  $webRes.Close()

  if($content -match '<a href="(/files/([0-9A-Za-z_\-]+)/astah_community/.+zip;jsessionid=([0-9A-Z]+))"')
  {
     $did = "$($matches[1])"
  }

  $downUrl = "http://members.change-vision.com${did}"
  $parentpath = "$(Split-Path -parent $(Split-Path -parent $MyInvocation.MyCommand.Definition))"
  Install-ChocolateyZipPackage 'astah' "$downUrl" "$parentpath" 
  
  $target = Join-Path $parentpath 'astah_community\astah-com.exe'
  Install-ChocolateyDesktopLink $target
  
  Write-ChocolateySuccess 'astah'
} catch {
  Write-ChocolateyFailure 'astah' "$($_.Exception.Message)"
  throw 
}