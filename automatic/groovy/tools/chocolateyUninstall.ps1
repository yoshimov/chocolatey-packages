$package = 'groovy-{{PackageVersion}}'
$binRoot = "$env:systemdrive\"
if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
$installDir = Join-Path $binRoot $package
Remove-Item -Path "$installDir" -Force -Recurse
