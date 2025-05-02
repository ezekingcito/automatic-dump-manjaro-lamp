#!/bin/bash

# Mostrar mensaje de inicio
echo "Automatic dump by 𝔸𝕝𝕖𝕛𝕒𝕟𝕕𝕣𝕠"

# Pedir datos al usuario
echo -n "Usuario de MySQL: "
read -r MYSQL_USER
echo -n "Contraseña de MySQL: "
stty -echo
read -r MYSQL_PASSWORD
stty echo
echo

echo -n "Ruta donde guardar los respaldos: "
read -r BACKUP_DIR

# Crear el directorio si no existe
mkdir -p "$BACKUP_DIR"

# Obtener la fecha y hora actual
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Bases de datos a ignorar
IGNORE_DB=("information_schema" "performance_schema" "mysql" "sys")

# Obtener la lista de bases de datos
DATABASES=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES;" | tail -n +2)

# Recorrer las bases de datos y hacer un respaldo de cada una
for DB in $DATABASES; do
    # Saltar bases de datos del sistema
    if [[ " ${IGNORE_DB[*]} " == *" $DB "* ]]; then
        echo "Base de datos $DB ignorada."
        continue
    fi

    # Verificar acceso a la base de datos
    if ! mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "USE $DB;" 2>/dev/null; then
        echo "No se pudo acceder a la base de datos: $DB. Se omite el respaldo."
        continue
    fi

    BACKUP_FILE="$BACKUP_DIR/${DB}_$DATE.sql"

    if [ -f "$BACKUP_FILE" ]; then
        echo "El respaldo de $DB ya existe. Se omite la duplicación."
    else
        mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB" > "$BACKUP_FILE"
        echo "Respaldo de $DB completado."
    fi

done

echo "Todos los respaldos se han guardado en $BACKUP_DIR"

