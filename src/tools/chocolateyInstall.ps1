$packageVersion = "6.3.0"
$packageArgs = @{
  checksum       = '9FE337F0DF7AA9D87AFF8D5CDEE78556CF14A0583BAC182F33FCB70D8F2C5B366CCF905BC445E6C249D776536DE52449DE7748EF00C2669D5636D141EF3922D5'
  checksumType   = 'sha512'
  checksum64     = '5EF31522355D99BC601237118E44495DC212143C8E8FCA524AED00B6C556AA040BED69024AA58F98DC73A9A052CF550C824C2BE50F6952697BC029F6F062A50F'
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
