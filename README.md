# Entorno Dockerizado para PrestaShop

Este proyecto proporciona un entorno Docker completo y listo para usar con PrestaShop.

## 🚀 Inicio Rápido

### Prerrequisitos

- Docker Desktop o Docker Engine instalado
- Docker Compose v3.8 o superior

### Instalación

1. **Clonar o descargar el proyecto**

2. **Configurar variables de entorno**

   Copia el archivo de ejemplo y ajusta los valores según tus necesidades:
   ```bash
   cp .env.example .env
   ```

3. **Iniciar los servicios**

   ```bash
   docker-compose up -d
   ```

4. **Acceder a PrestaShop**

   - Frontend: http://localhost:8080
   - Backend: http://localhost:8080/admin (o el valor de `PS_FOLDER_ADMIN`)
   - phpMyAdmin: http://localhost:8081

## 📁 Estructura del Proyecto

```
.
├── docker-compose.yml      # Configuración principal de Docker Compose
├── .env.example            # Variables de entorno de ejemplo
├── .env                    # Variables de entorno (crear desde .env.example)
├── 01-prestashop/          # Configuración de PrestaShop
│   ├── app/                # Archivos de PrestaShop (mapeados localmente)
│   │   ├── themes/         # Temas personalizados
│   │   ├── modules/        # Módulos y plugins
│   │   └── ...             # Todos los archivos de PrestaShop
│   ├── Dockerfile          # Dockerfile personalizado para PrestaShop
│   └── php.ini             # Configuración PHP personalizada
├── 02-db/                  # Configuración de base de datos
│   ├── my.cnf              # Configuración MySQL/MariaDB
│   └── init/               # Scripts SQL de inicialización
└── 03-etc/                 # Servicios adicionales
```

## ⚙️ Configuración

### Variables de Entorno Principales

Edita el archivo `.env` para personalizar:

- **PS_PORT**: Puerto para acceder a PrestaShop (default: 8080)
- **PS_DOMAIN**: Dominio de PrestaShop (default: localhost:8080)
- **PS_FOLDER_ADMIN**: Nombre de la carpeta de administración (default: admin)
- **DB_PORT**: Puerto de MySQL/MariaDB (default: 3306)
- **DB_ROOT_PASSWORD**: Contraseña root de la base de datos
- **PS_DB_PASSWD**: Contraseña del usuario de PrestaShop
- **PMA_PORT**: Puerto de phpMyAdmin (default: 8081)

### Servicios Incluidos

1. **PrestaShop** (`01-prestashop/`)
   - Imagen oficial de PrestaShop
   - PHP 8.1 con Apache
   - Extensiones MySQL habilitadas
   - **Archivos mapeados localmente** en `01-prestashop/app/` para desarrollo
   - Acceso directo a temas, módulos y plugins desde tu editor local

2. **Base de Datos** (`02-db/`)
   - MariaDB 10.11 (compatible con MySQL)
   - Configuración optimizada para PrestaShop
   - Persistencia de datos en volumen Docker

3. **phpMyAdmin** (`03-etc/`)
   - Interfaz web para gestión de base de datos
   - Acceso directo a la base de datos de PrestaShop

## 🛠️ Comandos Útiles

### Iniciar servicios
```bash
docker-compose up -d
```

### Detener servicios
```bash
docker-compose down
```

### Ver logs
```bash
docker-compose logs -f
```

### Ver logs de un servicio específico
```bash
docker-compose logs -f prestashop
docker-compose logs -f db
```

### Reiniciar un servicio
```bash
docker-compose restart prestashop
```

### Acceder al contenedor
```bash
docker-compose exec prestashop bash
docker-compose exec db bash
```

### Eliminar todo (incluyendo volúmenes)
```bash
docker-compose down -v
```

## 📝 Notas Importantes

- **Archivos de PrestaShop mapeados localmente**: Todos los archivos de PrestaShop están en `01-prestashop/app/` y se sincronizan con el contenedor
- Puedes trabajar directamente con temas en `01-prestashop/app/themes/` y módulos en `01-prestashop/app/modules/`
- Los datos de la base de datos se almacenan en volúmenes Docker para persistencia
- Al eliminar los volúmenes (`docker-compose down -v`), se perderán los datos de la BD pero NO los archivos de PrestaShop (están en local)
- El archivo `.env` no debe subirse al repositorio (está en `.gitignore`)
- Para producción, ajusta las configuraciones de seguridad en `.env`

## 🎨 Desarrollo de Temas y Plugins

Los archivos de PrestaShop están mapeados localmente en `01-prestashop/app/`, lo que te permite:

- **Trabajar con temas**: Edita archivos en `01-prestashop/app/themes/` directamente desde tu editor
- **Desarrollar módulos**: Crea y modifica módulos en `01-prestashop/app/modules/`
- **Acceso inmediato**: Los cambios se reflejan automáticamente (puede requerir limpiar caché de PrestaShop)

### Estructura de carpetas importantes:

```
01-prestashop/app/
├── themes/              # Temas personalizados
│   └── tu-tema/        # Tu tema personalizado
├── modules/            # Módulos y plugins
│   └── tu-modulo/      # Tu módulo personalizado
├── override/           # Overrides de clases
└── var/                # Caché y logs (ignorado en git)
```

### Limpiar caché de PrestaShop

Si los cambios no se reflejan, limpia la caché:

```bash
# Desde el contenedor
docker-compose exec prestashop rm -rf /var/www/html/var/cache/*
docker-compose exec prestashop rm -rf /var/www/html/var/smarty/cache/*
docker-compose exec prestashop rm -rf /var/www/html/var/smarty/compile/*
```

O desde el panel de administración de PrestaShop: Avanzado > Rendimiento > Limpiar caché

## 🔧 Solución de Problemas

### Puerto ya en uso
Si el puerto 8080 o 3306 ya está en uso, cambia los valores en `.env`:
```env
PS_PORT=8082
DB_PORT=3307
```

### Permisos de archivos
Si hay problemas de permisos, ajusta los permisos dentro del contenedor:
```bash
docker-compose exec prestashop chown -R www-data:www-data /var/www/html
docker-compose exec prestashop chmod -R 755 /var/www/html
```

**Nota**: En Windows, los permisos se gestionan automáticamente, pero si trabajas en Linux/Mac y tienes problemas, usa los comandos anteriores.

### Reiniciar desde cero
```bash
docker-compose down -v
docker-compose up -d
```

## 📚 Recursos

- [Documentación de PrestaShop](https://devdocs.prestashop.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

