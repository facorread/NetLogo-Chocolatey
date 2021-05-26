$packageVersion = "6.2.0"
$packageArgs = @{
  checksum       = '1976EBBB4066D829A0D2D2AB7DDCE886D13641BCF861B2EE5E787DFE7DDC921002E54335DA4E45F487915E1E0ED5A60A50AB975BBE9CD83E2665A6ECF93E92EE'
  checksumType   = 'sha512'
  checksum64     = 'A26AA8F25202945F4102E6FE19657FEECA27D76ED5B3D40150F98E5679255680A16E96606BBD87EFFBF70447C041BEBD6A9A8348FDA353038BE00EE6CAC16E93'
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
