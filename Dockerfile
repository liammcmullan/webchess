FROM php:5.6-apache

# Legacy extensions needed by WebChess (mysql_* et al.)
RUN docker-php-ext-install mysql mysqli pdo pdo_mysql

# Dev-friendly php.ini tweaks (optional)
RUN { \
  echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_NOTICE"; \
  echo "display_errors = On"; \
} > /usr/local/etc/php/conf.d/webchess.ini

RUN a2enmod rewrite

# Copy app into the image
WORKDIR /var/www/html
COPY app/ /var/www/html/

# Tighten perms inside container (www-data runs Apache)
RUN chown -R www-data:www-data /var/www/html
