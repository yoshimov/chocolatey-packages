try {
  $package = 'scala-2.10.0'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  Write-Host "Adding `'$installDir`' to the path and the current shell path"
  $zipUrl = 'http://www.scala-lang.org/downloads/distrib/files/scala-2.10.0.zip'

  Install-ChocolateyZipPackage 'scala' "$zipUrl" "$binRoot"
  
  Install-ChocolateyPath "$installDir\bin" 'User' # Machine will assert administrative rights
  Write-ChocolateySuccess 'scala'
} catch {
  Write-ChocolateyFailure 'scala' "$($_.Exception.Message)"
  throw 
}