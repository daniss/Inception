#!/bin/bash

# Start MySQL container
service mysql start;

# Create database
mysql -uroot -p$SQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;";

# Create user if it doesn't exist
mysql -uroot -p$SQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';";

# Grant privileges
mysql -uroot -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';";

# Change root privileges
mysql -uroot -p"$SQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

# Shutdown MySQL
mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown;

# Start MySQL container
exec mysqld_safe;