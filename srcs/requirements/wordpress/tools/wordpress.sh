#!/bin/bash

# Wait for MySQL to be ready
sleep 10;
if [ -d '/var/www/html' ]; then
    :
else
    mkdir /var/www/html;
    mv /var/www/wordpress/* /var/www/html;
    rm -rf /var/www/wordpress;
    wp-cli.phar config create	--allow-root \
    			--dbname=$SQL_DATABASE \
    			--dbuser=$SQL_USER \
    			--dbpass=$SQL_PASSWORD \
    			--dbhost=$SQL_HOST --path='/var/www/html'
    wp-cli.phar core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --path=/var/www/html;

    wp-cli.phar user create --allow-root $WP_USER2 $WP_EMAIL2 --user_pass=$WP_PASSWORD2 --role=author --path=/var/www/html;

    sed -i "40i define( 'WP_REDIS_HOST', 'redis' );"      /var/www/html/wp-config.php
    sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               /var/www/html/wp-config.php
    sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               /var/www/html/wp-config.php
    sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          /var/www/html/wp-config.php
    sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            /var/www/html/wp-config.php
fi

if [ -d '/run/php' ]; then
    :
else
    mkdir /run/php;
fi


exec php-fpm7.3 -F