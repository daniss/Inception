#!/bin/bash

service mariadb start;

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;";

mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';";

mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';";

mariadb -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO 'root'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -e "FLUSH PRIVILEGES;";

mysqladmin shutdown;

mysqld_safe;
