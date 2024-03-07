# Utilisez l'image officielle Debian Buster
FROM debian:buster

# Installez les paquets nécessaires (Nginx, OpenSSL)
RUN apt update && apt upgrade -y && apt install -y nginx openssl

# Créez un répertoire pour stocker les certificats SSL
RUN mkdir -p /etc/nginx/ssl/

# Créez un répertoire pour stocker les fichiers de configuration Nginx
RUN mkdir -p /var/run/nginx

# Générez les certificats SSL et la clé privée
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/public.crt \
    -subj "/C=FR/ST=Lyon/L=Lyon/O=42/CN=dcindrak.42.fr"

# Copiez la configuration Nginx
COPY conf/nginx.conf /etc/nginx/conf.d

# Exposez les ports 443
EXPOSE 443

# Ajoutez les droits d'accès pour Nginx
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

# Commande pour démarrer Nginx en arrière-plan
CMD ["nginx", "-g", "daemon off;"]
