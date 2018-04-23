FROM php:7.2-apache

RUN apt-get update \
&& apt-get install -y libpq-dev gettext \
&& docker-php-ext-install gettext pdo pdo_pgsql

COPY src/ /var/www/html
COPY poweradmin-entrypoint /usr/local/bin/

ENTRYPOINT ["poweradmin-entrypoint"]
CMD ["apache2-foreground"]
