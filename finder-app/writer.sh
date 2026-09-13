#!/bin/sh

if [ $# -lt 2 ]; then
  echo "Error: Faltan argumentos - writefile y writestr" >&2
  exit 1
fi

writefile="$1"
writestr="$2"

# Crear el directorio si no existe
mkdir -p "$(dirname "$writefile")"

# Intentar escribir, si falla -> error 1
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
  echo "Error: No se pudo crear $writefile" >&2
  exit 1
fi
