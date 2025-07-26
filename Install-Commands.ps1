# Install-Commands.ps1
# Este script crea alias en tu perfil de PowerShell para los comandos a_utf8 y a_win1252

# Verificar si el perfil de PowerShell existe, si no, crearlo
$profileDir = Split-Path -Parent $PROFILE
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}
if (-not (Test-Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}

# Obtener la ruta completa del directorio actual
$scriptDir = $PSScriptRoot

# Comandos a añadir al perfil
$aliasCommands = @"
# Alias para los comandos de VB6 IA Tools
function a_utf8 { & "$scriptDir\a_utf8.sh" @args }
function a_win1252 { & "$scriptDir\a_win1252.sh" @args }

# Mostrar mensaje de ayuda
Write-Host "Comandos instalados correctamente:" -ForegroundColor Green
Write-Host "- a_utf8" -ForegroundColor Cyan
Write-Host "- a_win1252" -ForegroundColor Cyan
Write-Host "¡Listo para usar!" -ForegroundColor Green
"@

# Añadir los comandos al perfil si no existen ya
$profileContent = Get-Content $PROFILE -ErrorAction SilentlyContinue -Raw
if ($profileContent -notmatch "function a_utf8") {
    Add-Content -Path $PROFILE -Value "`n$aliasCommands"
    Write-Host "Comandos añadidos a tu perfil de PowerShell: $PROFILE" -ForegroundColor Green
} else {
    Write-Host "Los comandos ya están instalados en tu perfil de PowerShell." -ForegroundColor Yellow
}

# Cargar el perfil actualizado
. $PROFILE

Write-Host "`nInstalación completada. Los comandos están listos para usar en nuevas ventanas de PowerShell." -ForegroundColor Green
Write-Host "Puedes usarlos con: a_utf8 o a_win1252" -ForegroundColor Cyan
