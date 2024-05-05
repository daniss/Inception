FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt -y install wget && mkdir /run/php/

WORKDIR /var/www/

RUN apt-get install -y php-fpm php7.4-mysqli wget mariadb-client

COPY ./tools/wordpress.sh /tmp/wordpress.sh

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf



RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm -rf latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar

RUN chmod +x /tmp/wordpress.sh

EXPOSE 9000

CMD ["bash", "/tmp/wordpress.sh"]