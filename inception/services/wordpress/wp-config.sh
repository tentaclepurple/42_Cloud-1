#!/bin/bash

# Esperar por MySQL usando /dev/tcp
until ping -c 1 mysql > /dev/null 2>&1; do
    echo "Waiting for MySQL..."
    sleep 1
done

# Download WordPress if not exists
if [ ! -f "wp-config.php" ]; then
    wp core download --allow-root

    # Create wp-config.php
    wp config create \
        --dbname=$WORDPRESS_DB_NAME \
        --dbuser=$WORDPRESS_DB_USER \
        --dbpass=$WORDPRESS_DB_PASSWORD \
        --dbhost=$WORDPRESS_DB_HOST \
        --allow-root

    # Install WordPress
    wp core install \
        --url=localhost \
        --title="WordPress Site" \
        --admin_user=admin \
        --admin_password=admin123 \
        --admin_email=admin@example.com \
        --allow-root
fi

# Set correct permissions
chown -R www-data:www-data /var/www/html

# Start PHP-FPM
exec php-fpm7.4 -F
