$package = 'scala-{{PackageVersion}}'
$pkgid = '{{PackageName}}'

$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

$binRoot = Get-BinRoot
$installDir = Join-Path $binRoot $package
Write-Host "Adding `'$installDir`' to the path and the current shell path"
$zipUrl = '{{DownloadUrl}}'
Install-ChocolateyZipPackage $pkgid "$zipUrl" "$binRoot"
Install-ChocolateyPath "$installDir\bin" 'User' # Machine will assert administrative rights
