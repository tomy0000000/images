FROM php:7.4-fpm

LABEL tech.tomy.docker.php-fpm=""
LABEL maintainer="Tomy Hsieh @tomy0000000"
LABEL version="1.1"

WORKDIR $PHP_INI_DIR
EXPOSE 9000

# Install Composor
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP Extension
RUN apt update && apt install -y \
        zip \
        unzip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
