# Instala las skills de este repo en %USERPROFILE%\.claude\skills (Windows).
#   .\install.ps1          copia los archivos (vuelve a ejecutarlo tras `git pull`)
#   .\install.ps1 -Link    crea enlaces (junctions): un `git pull` basta para actualizar
param([switch]$Link)
$ErrorActionPreference = "Stop"

$repo = $PSScriptRoot
$dest = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME ".claude\skills" }
New-Item -ItemType Directory -Force -Path $dest | Out-Null

Get-ChildItem -Directory (Join-Path $repo "skills") | ForEach-Object {
  $target = Join-Path $dest $_.Name
  if (Test-Path $target) { Remove-Item -Recurse -Force $target }
  if ($Link) {
    New-Item -ItemType Junction -Path $target -Target $_.FullName | Out-Null
  } else {
    Copy-Item -Recurse $_.FullName $target
  }
  Write-Host "OK $($_.Name)"
}
Write-Host "Listo: skills instaladas en $dest. Reinicia Claude Code."
