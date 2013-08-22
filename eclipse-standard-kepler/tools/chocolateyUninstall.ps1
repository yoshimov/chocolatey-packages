try {
  $cname = "eclipse-standard-kepler"
  $package = 'eclipse-kepler-4.3'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  Remove-Item -Force -Recurse $installDir

  Write-ChocolateySuccess "$name"
} catch {
  Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
  #throw 
}