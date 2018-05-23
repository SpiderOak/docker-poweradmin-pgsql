FROM php:7.1-apache

RUN apt-get update && apt-get install -y \
gettext \
libmcrypt-dev \
libpq-dev \
&& docker-php-ext-install \
gettext \
mcrypt \
pdo \
pdo_pgsql \
&& true

COPY src/ /usr/share/pdns
COPY poweradmin-entrypoint /usr/local/bin/

ENTRYPOINT ["poweradmin-entrypoint"]
CMD ["apache2-foreground"]
