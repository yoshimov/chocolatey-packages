[void]([Reflection.Assembly]::LoadWithPartialName("System.Web"))
$word = [Web.HttpUtility]::UrlEncode($word)
$url = 'http://members.change-vision.com/files/astah_community/6_6_4/astah-community-6_6_4-41775-jre-setup.exe'
$webReq = [Net.HttpWebRequest]::Create("$url")
$webReq.Method = "GET"

$webRes = $webReq.GetResponse()
$sr = New-Object IO.StreamReader($webRes.GetResponseStream(), $webRes.ContentEncoding)
$content = $sr.ReadToEnd()
$sr.Close()
$webRes.Close()

#echo $content
if($content -match '<a href="(/files/([0-9A-Za-z_\-]+)/astah_community/.+exe;jsessionid=[0-9A-Z]+)"')
{
     echo "$($matches[1])"
     echo "$($matches[2])"
}
