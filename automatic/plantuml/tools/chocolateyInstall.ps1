$cname = 'plantuml'
#try {
  $downUrl = 'http://downloads.sourceforge.net/project/plantuml/plantuml.jar?r=http%3A%2F%2Fplantuml.sourceforge.net%2Fdownload.html&ts=1389254943&use_mirror=autoselect'
  $toolspath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  # installer, will assert administrative rights
  Get-ChocolateyWebFile $cname "${toolspath}\plantuml.jar" "$downUrl"
  Generate-BinFile $cname "${toolspath}\plantuml.cmd" False

  # the following is all part of error handling
  Write-ChocolateySuccess '{{PackageName}}'
#} catch {
#  Write-ChocolateyFailure '{{PackageName}}' "$($_.Exception.Message)"
#  throw 
#}
