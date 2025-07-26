#!/bin/bash

# Script para convertir archivos de UTF-8 a Win1252
# Uso: ./a_win1252.sh [directorio]

# Si no se especifica directorio, usar el directorio actual
DIR=${1:-.}

# Encontrar y convertir archivos
find "$DIR" -type f \( -name "*.bas" -o -name "*.cls" -o -name "*.frm" -o -name "*.vbp" \) -print0 | while IFS= read -r -d $'\0' file; do
    # echo "Convirtiendo: $file"
    # Crear archivo temporal
    temp_file=$(mktemp)
    # Convertir de UTF-8 a Win1252
    if iconv -f UTF-8 -t WINDOWS-1252 "$file" > "$temp_file"; then
        # Si la conversión es exitosa, reemplazar el archivo original
        mv "$temp_file" "$file"
        # echo "  Convertido a Win1252: $file"
    else
        echo "  Error al convertir: $file"
        rm -f "$temp_file"
    fi
done

echo "Proceso completado."

echo -e "\nPresiona cualquier tecla para continuar..."
read -n 1 -s -r