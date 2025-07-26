# vb6-ia-tools
Tools for use IA on VB6 (Visual Basic 6)

## Scripts de conversión

### Versión Bash (Linux/macOS/WSL/Windows)
- `a_utf8.sh` - Convierte archivos de Windows-1252 a UTF-8
- `a_win1252.sh` - Convierte archivos de UTF-8 a Windows-1252

### Versión PowerShell (Windows)
- `ConvertTo-Utf8.ps1` - Convierte archivos de Windows-1252 a UTF-8
- `ConvertTo-Win1252.ps1` - Convierte archivos de UTF-8 a Windows-1252

## Uso de los scripts de PowerShell

### Convertir a UTF-8
```powershell
.\ConvertTo-Utf8.ps1 [-Path "ruta\al\directorio"]
```

### Convertir a Windows-1252
```powershell
.\ConvertTo-Win1252.ps1 [-Path "ruta\al\directorio"]
```

### Ejemplos

1. Convertir archivos en el directorio actual:
   ```powershell
   .\ConvertTo-Utf8.ps1
   ```

2. Convertir archivos en un directorio específico:
   ```powershell
   .\ConvertTo-Utf8.ps1 -Path "C:\ruta\a\mi\proyecto"
   ```

## Características
- Procesa archivos .bas, .cls, .frm y .vbp de forma recursiva
- Muestra un resumen de la conversión
- Manejo de errores detallado
- Compatible con PowerShell 5.1 y versiones posteriores

## Notas
- Los scripts de PowerShell están diseñados para Windows.
- Los scripts de bash requieren `iconv` instalado.
- Se recomienda hacer una copia de seguridad de los archivos antes de la conversión.
