try {
  # obtain download id from web
  [void]([Reflection.Assembly]::LoadWithPartialName("System.Web"))
  $url = 'http://www.truecrypt.org/downloads'
  $webReq = [Net.HttpWebRequest]::Create("$url")
  $webReq.Method = "GET"
  
  $webRes = $webReq.GetResponse()
  $sr = New-Object IO.StreamReader($webRes.GetResponseStream(), $webRes.ContentEncoding)
  $content = $sr.ReadToEnd()
  $sr.Close()
  $webRes.Close()

  if($content -match 'name="LinkT" value="([0-9a-z]+)">')
  {
     $did = "$($matches[1])"
     Echo "download id = $did"
  }

  $downUrl = "http://www.truecrypt.org/download/transient/${did}/TrueCrypt%20Setup%207.1a.exe"
  Echo "download url = $downUrl"
  # installer, will assert administrative rights
  Install-ChocolateyPackage 'truecrypt' 'EXE' '/S' "$downUrl" -validExitCodes @(0)
  
  # the following is all part of error handling
  Write-ChocolateySuccess 'truecrypt'
} catch {
  Write-ChocolateyFailure 'truecrypt' "$($_.Exception.Message)"
  throw 
}