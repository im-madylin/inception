#!/bin/bash

check_mariadb_connection() {
    if mysqladmin ping -h"$MARIA_DB_HOST" -u"$MARIA_DB_USER" -p"$MARIA_DB_USER_PW" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

wait_for_mariadb() {
    while ! check_mariadb_connection; do
        echo "Waiting for MariaDB server to start..."
        sleep 5
    done
}

wait_for_mariadb

wp-cli core download --allow-root
wp-cli config create --dbname=$MARIA_DB --dbuser=$MARIA_DB_USER --dbpass=$MARIA_DB_USER_PW --dbhost=$MARIA_DB_HOST --allow-root
wp-cli core install --url=$DOMAIN --title=$WORDPRESS --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PW --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
wp-cli user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PW --role=subscriber --allow-root
wp-cli theme install astra --allow-root
wp-cli theme update astra --allow-root
wp-cli theme activate astra --allow-root

exec /usr/sbin/php-fpm7.4 -F