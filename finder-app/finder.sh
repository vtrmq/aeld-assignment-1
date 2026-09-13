#!/bin/sh

# Verifica que se pasaron dos argumentos
if [ $# -lt 2 ]; then
  echo "Error: Se requieren dos argumentos - filesdir y searchstr"
  echo "Usage: $0 <filesdir> <searchstr>"
  exit 1
fi

filesdir="$1"
searchstr="$2"

# Verificar que filesdir es un directorio
if [ ! -d "$filesdir" ]; then
  echo "Error: $filesdir no es un directorio"
  exit 1
fi

# Contar archivos y lineas coincidentes
num_files=$(find "$filesdir" -type f | wc -l)
num_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_lines"
