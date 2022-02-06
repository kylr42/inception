FROM debian:buster

RUN apt-get update \
    && apt -y install php7.3 php-mysqli php-fpm mariadb-client


ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz && \
    rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz && \
    rm -f /var/www/wordpress/wp-config-sample.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./conf/wp-config.php ./var/www/wordpress/
COPY tools/entrypoint.sh /

ENTRYPOINT [ "sh", "entrypoint.sh" ]

CMD [ "./usr/sbin/php-fpm7.3", "-F" ]
