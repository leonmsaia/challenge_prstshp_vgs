FROM prestashop/prestashop:8.1-apache

# Instalar extensiones PHP adicionales si es necesario
RUN docker-php-ext-install pdo_mysql mysqli

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html

# Exponer puerto
EXPOSE 80

