# https://github.com/docker-library/php/blob/4b7da48c965c32148d028919e224d19cb14898db/7.4/buster/fpm/Dockerfile
FROM php:7.4-fpm

# installing some other tools
RUN apt-get update && \
    apt-get install -y apt-file && \
    apt-file update && \
    apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
