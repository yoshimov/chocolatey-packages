try { #error handling is only necessary if you need to do anything in addition to/instead of the main helpers
  $package = 'eclipse-juno'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  Write-Host "Adding `'$installDir`' to the path and the current shell path"
  $zipUrl = 'http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/juno/R/eclipse-java-juno-win32.zip&r=1'
  $zip64Url = 'http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/juno/R/eclipse-java-juno-win32-x86_64.zip&r=1'

  Install-ChocolateyZipPackage 'eclipse-java-juno' "$zipUrl" "$binRoot" "$zip64Url"
  
  Rename-Item "$binRoot\eclipse" "$package" -Force

  $target = Join-Path $installDir 'eclipse.exe'
  Install-ChocolateyDesktopLink $target

  Write-ChocolateySuccess 'eclipse-java-juno'
} catch {
  Write-ChocolateyFailure 'eclipse-java-juno' "$($_.Exception.Message)"
  #throw 
}