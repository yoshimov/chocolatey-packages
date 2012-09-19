cd /d "%~dp0"
if not "%2"=="" set http_proxy=http://%2/
..\install-tl-20120919\install-tl.bat -v --no-persistent-downloads -profile %1
