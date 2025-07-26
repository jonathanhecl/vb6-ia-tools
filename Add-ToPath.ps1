# Add-ToPath.ps1
# Este script añade el directorio actual al PATH del sistema

# Verificar si se está ejecutando como administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "Este script requiere permisos de administrador para modificar el PATH del sistema." -ForegroundColor Red
    Write-Host "Por favor, ejecuta PowerShell como administrador y vuelve a intentarlo." -ForegroundColor Yellow
    exit 1
}

# Obtener la ruta actual
$currentPath = $PSScriptRoot

# Obtener el PATH actual del sistema
$systemPath = [Environment]::GetEnvironmentVariable('Path', 'Machine')

# Verificar si la ruta ya está en el PATH
if ($systemPath -split ';' -contains $currentPath) {
    Write-Host "La ruta ya está en el PATH del sistema." -ForegroundColor Yellow
    exit 0
}

# Añadir la ruta al PATH
$newPath = $systemPath + ";$currentPath"
[Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')

# Actualizar el PATH en la sesión actual
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "`nRuta añadida al PATH del sistema correctamente:" -ForegroundColor Green
Write-Host $currentPath -ForegroundColor Cyan
Write-Host "`nLos cambios se aplicarán en nuevas ventanas de terminal." -ForegroundColor Green
