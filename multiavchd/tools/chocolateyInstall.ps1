try {
  $baseUrl = "http://www.sendspace.com/file/zajv0n"
  [void]([Reflection.Assembly]::LoadWithPartialName("System.Web"))
  $webReq = [Net.HttpWebRequest]::Create("$baseUrl")
  $webReq.Method = "GET"

  $webRes = $webReq.GetResponse()
  $sr = New-Object IO.StreamReader($webRes.GetResponseStream(), $webRes.ContentEncoding)
  $content = $sr.ReadToEnd()
  $sr.Close()
  $webRes.Close()

  #echo $content
  if($content -match 'id="download_button" href="(http:[\/\.0-9a-zA-Z_]+)"')
  {
     $downUrl = $matches[1]
#     echo "$($matches[1])"
  }

  Install-ChocolateyPackage 'multiavchd' 'EXE' '/S' "$downUrl" -validExitCodes @(0)

  Write-ChocolateySuccess 'multiavchd'
} catch {
  Write-ChocolateyFailure 'multiavchd' "$($_.Exception.Message)"
  throw 
}
