#!/bin/bash
set -x  # Esto mostrará cada comando que se ejecuta
echo "Starting MySQL initialization..."
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Installing MySQL..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    
    echo "Starting MySQL temporarily..."
    mysqld --user=mysql --datadir=/var/lib/mysql &
    sleep 5
    
    echo "Creating database and user..."
    echo "MYSQL_DATABASE: ${MYSQL_DATABASE}"
    echo "MYSQL_USER: ${MYSQL_USER}"
    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
    
    if [ $? -eq 0 ]; then
        echo "Database and user created successfully"
    else
        echo "Error creating database and user"
    fi
    
    echo "Stopping temporary MySQL..."
    pkill mysqld
    sleep 5
fi

echo "Starting MySQL server..."
exec mysqld --user=mysql --datadir=/var/lib/mysql
