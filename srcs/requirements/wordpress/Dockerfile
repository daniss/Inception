FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get -y install wget && apt-get -y install php7.3 php-fpm php-mysql mariadb-client sendmail

RUN wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar
RUN chmod +x /usr/local/bin/wp-cli.phar

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY tools/wordpress.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh

CMD [ "/tmp/wordpress.sh" ]