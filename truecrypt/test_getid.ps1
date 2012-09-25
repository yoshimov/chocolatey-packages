[void]([Reflection.Assembly]::LoadWithPartialName("System.Web"))
$word = [Web.HttpUtility]::UrlEncode($word)
$url = 'http://www.truecrypt.org/downloads'
$webReq = [Net.HttpWebRequest]::Create("$url")
$webReq.Method = "GET"

$webRes = $webReq.GetResponse()
$sr = New-Object IO.StreamReader($webRes.GetResponseStream(), $webRes.ContentEncoding)
$content = $sr.ReadToEnd()
$sr.Close()
$webRes.Close()

#echo $content
if($content -match 'name="LinkT" value="([0-9a-z]+)">')
{
     echo "$($matches[1])"
}
