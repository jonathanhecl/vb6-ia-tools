#!/bin/bash

# Script para convertir archivos de Win1252 a UTF-8
# Uso: ./a_utf8.sh [directorio]

# Si no se especifica directorio, usar el directorio actual
DIR=${1:-.}

# Encontrar y convertir archivos
find "$DIR" -type f \( -name "*.bas" -o -name "*.cls" -o -name "*.frm" -o -name "*.vbp" \) -print0 | while IFS= read -r -d $'\0' file; do
    # echo "Convirtiendo: $file"
    # Crear archivo temporal
    temp_file=$(mktemp)
    # Convertir de Win1252 a UTF-8
    if iconv -f WINDOWS-1252 -t UTF-8 "$file" > "$temp_file"; then
        # Si la conversión es exitosa, reemplazar el archivo original
        mv "$temp_file" "$file"
        # echo "  Convertido a UTF-8: $file"
    else
        echo "  Error al convertir: $file"
        rm -f "$temp_file"
    fi
done

echo "Proceso completado."

echo -e "\nPresiona cualquier tecla para continuar..."
read -n 1 -s -r