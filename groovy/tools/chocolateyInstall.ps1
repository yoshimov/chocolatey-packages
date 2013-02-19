try {
  $package = 'groovy-2.1.0'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  Write-Host "Adding `'$installDir`' to the path and the current shell path"
  $zipUrl = 'http://dist.groovy.codehaus.org/distributions/groovy-binary-2.1.0.zip'

  Install-ChocolateyZipPackage 'groovy' "$zipUrl" "$binRoot"
  
  Install-ChocolateyPath "$installDir\bin" 'User' # Machine will assert administrative rights

  Write-ChocolateySuccess 'groovy'
} catch {
  Write-ChocolateyFailure 'groovy' "$($_.Exception.Message)"
  throw 
}