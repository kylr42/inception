FROM debian:buster

LABEL name="Jimbo Siona"
LABEL email="<jsiona@student.21-school.ru>"

RUN apt update && apt upgrade -y
RUN apt install -y nginx openssl vim wget unzip php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl mariadb-server mariadb-client
RUN wget -P tmp/ https://wordpress.org/latest.tar.gz && wget -P tmp/ https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.zip



COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/phpmyadmin.php /tmp/config.inc.php
COPY ./srcs/wordpress.php /tmp/wp-config.php
COPY ./srcs/backup.sql ./backup.sql
COPY ./srcs/start.sh ./

CMD bash start.sh