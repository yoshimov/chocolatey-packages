[void]([Reflection.Assembly]::LoadWithPartialName("System.Web"))
$url = 'http://www.sendspace.com/file/zajv0n'
$webReq = [Net.HttpWebRequest]::Create("$url")
$webReq.Method = "GET"

$webRes = $webReq.GetResponse()
$sr = New-Object IO.StreamReader($webRes.GetResponseStream(), $webRes.ContentEncoding)
$content = $sr.ReadToEnd()
$sr.Close()
$webRes.Close()

#echo $content
if($content -match 'id="download_button" href="(http:[\/\.0-9a-zA-Z_]+)"')
{
     echo "$($matches[1])"
}
