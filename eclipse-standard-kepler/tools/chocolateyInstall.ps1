try {
  $cname="eclipse-standard-kepler"
  $package = 'eclipse-kepler-4.3'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  $zipUrl = 'http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/kepler/R/eclipse-standard-kepler-R-win32.zip&r=1'
  $zip64Url = 'http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/kepler/R/eclipse-standard-kepler-R-win32-x86_64.zip&r=1'

  Install-ChocolateyZipPackage "$cname" "$zipUrl" "$binRoot" "$zip64Url"
  
  if (Test-Path "$installDir") {
    $today = $(Get-Date -Format "yyyyMMdd")
    Move-Item "$installDir" "${installDir}.${today}"
  }
  Rename-Item "${binRoot}\eclipse" "$package" -Force

  $target = Join-Path $installDir 'eclipse.exe'
  Install-ChocolateyDesktopLink $target

  Write-ChocolateySuccess "$cname"
} catch {
  Write-ChocolateyFailure "$cname" "$($_.Exception.Message)"
  #throw 
}