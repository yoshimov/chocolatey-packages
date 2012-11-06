try {
  $package = 'groovy-2.0.5'
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package

  Remove-Item -Path "$installDir" -Force -Recurse

  Write-ChocolateySuccess 'groovy'
} catch {
  Write-ChocolateyFailure 'groovy' "$($_.Exception.Message)"
  throw 
}
