FROM php:7.4-apache

# Install required packages
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions required by OpenCart
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    mysqli \
    pdo \
    pdo_mysql \
    zip \
    gd \
    mbstring \
    xml \
    curl

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set server name
RUN echo 'ServerName danial-uk.loc' >> /etc/apache2/apache2.conf

# Set permissions for OpenCart directories
RUN chown -R www-data:www-data /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Start Apache in foreground
CMD ["apache2-foreground"] 