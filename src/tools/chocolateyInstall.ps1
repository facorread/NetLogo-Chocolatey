$packageVersion = "6.4.0"
$packageArgs = @{
  checksum       = 'FBEDD97C50C394A231B1E36337BD94B66C3E10400D751BAF886FAE37ED4FDBA5BA53ED2E5116AE5FD602CBB49CC2E362BF51A5FFCB95F758BF94BA1BFF2F5AEC'
  checksumType   = 'sha512'
  checksum64     = '322859C7AB49FFB4A431D326782487C76B2D27105C8369D68287E199259E22567128C112E41AEBAF8FA96139AE4853262BEC29F3563B21EA9A9064051C9BBB13'
  checksumType64 = 'sha512'
  packageName    = 'NetLogo'
  fileType       = 'msi'
  silentArgs     = '-q'
  softwareName   = 'NetLogo*'
  url            = "https://ccl.northwestern.edu/netlogo/$packageVersion/NetLogo-$packageVersion-32.msi"
  Url64bit       = "https://ccl.northwestern.edu/netlogo/$packageVersion/NetLogo-$packageVersion-64.msi"
}

Install-ChocolateyPackage @packageArgs

#install start menu shortcuts
$programsMenu = [environment]::GetFolderPath([environment+specialfolder]::CommonPrograms)
$programFiles = [environment]::GetFolderPath([environment+specialfolder]::ProgramFiles)
$programFilesX86 = [environment]::GetFolderPath([environment+specialfolder]::ProgramFilesX86)

$WorkingDirectory = Join-Path $programFiles "NetLogo $packageVersion"
$TargetPath = Join-Path $WorkingDirectory "NetLogo.exe"
if (Test-Path $TargetPath) {
  $ShortcutFilePath = Join-Path $programsMenu "NetLogo.lnk"
  Install-ChocolateyShortcut -ShortcutFilePath $ShortcutFilePath -TargetPath $TargetPath -WorkingDirectory $WorkingDirectory
}

$WorkingDirectory = Join-Path $programFilesX86 "NetLogo $packageVersion"
$TargetPath = Join-Path $WorkingDirectory "NetLogo.exe"
if (Test-Path $TargetPath) {
  $ShortcutFilePath = Join-Path $programsMenu "NetLogo (x86).lnk"
  Install-ChocolateyShortcut -ShortcutFilePath $ShortcutFilePath -TargetPath $TargetPath -WorkingDirectory $WorkingDirectory
}
