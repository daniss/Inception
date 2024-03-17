FROM debian:buster

RUN		apt-get update
RUN		apt-get install -y redis \
		&& rm -rf /var/lib/apt/lists/*
RUN		sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
RUN		sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
RUN		sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode no"]