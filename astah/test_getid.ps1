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

#echo $content
if($content -match '<a href="(/files/([0-9A-Za-z_\-]+)/astah_community/.+zip;jsessionid=([0-9A-Z]+))"')
{
     echo "$($matches[1])"
     echo "$($matches[2])"
}
