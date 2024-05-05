FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /tmp/mariadb.sh

RUN chmod 0777 /tmp/mariadb.sh

EXPOSE 3306

CMD ["/tmp/mariadb.sh"]