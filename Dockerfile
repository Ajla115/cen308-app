FROM php:8.1-apache

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable .htaccess support and mod_rewrite
RUN a2enmod rewrite

# Copy your API folder contents into Apache's web root
COPY ./api /var/www/html

# Set working directory
WORKDIR /var/www/html

# Fix permissions (optional but recommended)
RUN chown -R www-data:www-data /var/www/html

# Expose Apache port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
