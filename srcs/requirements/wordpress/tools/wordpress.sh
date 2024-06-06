#!/bin/bash

sleep 10

wp-cli.phar config create --allow-root \
			--dbname=$SQL_DATABASE \
			--dbuser=$SQL_USER \
			--dbpass=$SQL_PASSWORD \
			--dbhost=$SQL_HOST --path='/var/www/wordpress'
wp-cli.phar core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --path="/var/www/wordpress";
wp-cli.phar user create --allow-root $WP_USER2 $WP_EMAIL2 --user_pass=$WP_PASSWORD2 --role=author --path="/var/www/wordpress";
chown -R www-data:www-data /var/www/wordpress
sed -i "40i define( 'WP_REDIS_HOST', 'redis' );"      /var/www/wordpress/wp-config.php
sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               /var/www/wordpress/wp-config.php
sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            /var/www/wordpress/wp-config.php


exec php-fpm7.4 -F