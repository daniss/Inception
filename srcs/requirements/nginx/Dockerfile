FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/

RUN mkdir -p /var/run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/public.crt \
    -subj "/C=FR/ST=Lyon/L=Lyon/O=42/CN=dcindrak.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
