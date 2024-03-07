FROM debian:buster

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

#Copie des fichiers de configuration
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /tmp/mariadb.sh

RUN chmod +x /tmp/mariadb.sh

ENTRYPOINT ["/tmp/mariadb.sh"]