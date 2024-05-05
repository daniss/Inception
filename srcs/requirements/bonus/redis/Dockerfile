FROM debian:bullseye

RUN		apt-get update
RUN		apt-get install -y redis

# By default, Redis listens for connections from all the network interfaces available on the server.
RUN		sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
RUN		sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
RUN		sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

# protected-mode no: allow remote access to the Redis server
CMD ["redis-server", "--protected-mode no"]