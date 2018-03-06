FROM php:7.1-fpm

RUN apt-get update && apt-get install -y -q --no-install-recommends \
    git \
    ssh-client \
    libssl-dev \
    librabbitmq-dev \
    libgeoip-dev \
    libbz2-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
    zip

RUN pecl install \
    xdebug

RUN docker-php-ext-enable \
    xdebug

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp
