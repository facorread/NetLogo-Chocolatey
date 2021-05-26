$programsMenu = [environment]::GetFolderPath([environment+specialfolder]::CommonPrograms)

$ShortcutFilePath = Join-Path $programsMenu "NetLogo.lnk"
if (Test-Path $ShortcutFilePath) {
  Remove-Item -LiteralPath $ShortcutFilePath
}

$ShortcutFilePath = Join-Path $programsMenu "NetLogo (x86).lnk"
if (Test-Path $ShortcutFilePath) {
  Remove-Item -LiteralPath $ShortcutFilePath
}
