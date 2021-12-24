mkdir -p /etc/ssl/certs /etc/ssl/private

openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 365 \
                -nodes \
                -out /etc/ssl/certs/nginx.crt \
                -keyout /etc/ssl/private/nginx.key \
                -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21School/OU=jsiona/CN=localhost";

chown -R www-data:www-data /etc/ssl/;
chown -R www-data:www-data /etc/ssl;
chown -R www-data:www-data /var/lib/nginx;

nginx -g "daemon off;"