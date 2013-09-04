try {
  $package = 'scala-2.10.2'
  $pkgid = 'scala'

  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package

  Remove-Item -Path "$installDir" -Force -Recurse

  Write-ChocolateySuccess $pkgid
} catch {
  Write-ChocolateyFailure $pkgid "$($_.Exception.Message)"
  throw 
}
