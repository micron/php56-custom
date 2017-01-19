FROM php:5.6.29-fpm
MAINTAINER miron.ogrodowicz@kreativrudel.de

RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y \
        libjpeg-dev \
        libpng12-dev \
        libssl-dev \
        libicu-dev \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install gd mysqli opcache exif fileinfo; \
    \
    pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    \
    pecl install phar; \
    docker-php-ext-install phar; \
    \
    pecl install intl; \
    docker-php-ext-install intl; \
    \
    docker-php-ext-install pdo pdo_mysql

EXPOSE 9000%
