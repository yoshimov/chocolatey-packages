try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  $package = 'scala-2.9.2'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  Write-Host "Adding `'$installDir`' to the path and the current shell path"
  $zipUrl = 'http://www.scala-lang.org/downloads/distrib/files/scala-2.9.2.zip'

  Install-ChocolateyZipPackage 'scala' "$zipUrl" "$binRoot"
  
#  Move-Item "$($installDir)\scala-2.9.2\*" "$installDir" -Force -Recurse

  Install-ChocolateyPath "$installDir\bin" 'User' # Machine will assert administrative rights
  Write-ChocolateySuccess 'scala'
} catch {
  Write-ChocolateyFailure 'scala' "$($_.Exception.Message)"
  throw 
}