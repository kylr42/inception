#!/bin/bash

if [ -f /var/www/wordpress/wp-config.php ]
then
	sed -ie s/'$DB_NAME'/$DB_NAME/g var/www/wordpress/wp-config.php
	sed -ie s/'$DB_USER'/$DB_USER/g var/www/wordpress/wp-config.php
	sed -ie s/'$DB_PASSWORD'/$DB_PASSWORD/g var/www/wordpress/wp-config.php
	rm -f /var/www/wordpress/wp-config-sample.php
else 
    echo "Config not found..."
    exit 1
fi

mkdir -p ./run/php/

exec "$@"