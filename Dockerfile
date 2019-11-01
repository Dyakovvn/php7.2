# DO NOT MODIFY THIS AUTOGENERATED FILE
# Change it in m4 folder
FROM prooph/php:7.2-fpm
RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache

# Copy configuration
COPY config/opcache.ini $PHP_INI_DIR/conf.d/

RUN apk add freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev autoconf g++ imagemagick-dev imagemagick libtool make  git mysql-client rsync p7zip openssh-client \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install zip

# Install APCu and APC backward compataibility
RUN  pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini
