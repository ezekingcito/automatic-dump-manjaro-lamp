# MySQL Backup Script

![Bash](https://img.shields.io/badge/-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![MySQL](https://img.shields.io/badge/-MySQL-4479A1?logo=mysql&logoColor=white)
![Automation](https://img.shields.io/badge/-Automation-FF6F00)

## 📝 Descripción

Script Bash automatizado para realizar respaldos completos de bases de datos MySQL/MariaDB. Crea archivos SQL independientes para cada base de datos con marca de tiempo, excluyendo automáticamente las bases de datos del sistema.

## ✨ Características principales

- ✔️ Interfaz interactiva amigable
- 🔒 Entrada segura de contraseña (no visible)
- ⚡ Auto-creación de directorios de respaldo
- 📅 Nombres de archivo con timestamp preciso
- 🚫 Exclusión automática de DBs del sistema
- 🔄 Verificación y prevención de duplicados
- ✅ Validación de acceso a bases de datos

## 🛠 Requisitos del sistema

- Bash (v4.0+ recomendado)
- MySQL/MariaDB instalado
- Herramienta `mysqldump` disponible
- Permisos de ejecución en el script
- Credenciales válidas de MySQL con privilegios de lectura

## 🚀 Instrucciones de uso básico

1. Descargar el script:
   ```bash
   https://github.com/ezekingcito/automatic-dump-manjaro-lamp.git
