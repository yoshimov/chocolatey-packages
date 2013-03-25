function CheckMD5 {
param(
  [string] $filepath = '',
  [string] $hashstr = ''
)
  $h = [System.Security.Cryptography.MD5]::Create()
  $filestream = New-Object IO.StreamReader $filepath
  $hashBytes = $h.ComputeHash($filestream.BaseStream)
  $filestream.Close()
  $builder = New-Object System.Text.StringBuilder
  $hashBytes | Foreach-Object { [void] $builder.Append($_.ToString("X2")) }
  if ($builder.ToString().ToLower() -eq $hashstr.ToLower()) {
    return True
  }
  return False
}
