#!/bin/bash

rm -rf /var/lib/mysql/*


mysql_install_db --datadir=/var/lib/mysql

service mariadb start

sleep 5

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MARIA_DB;
CREATE USER '$MARIA_DB_USER'@'%' IDENTIFIED BY '$MARIA_DB_USER_PW';
GRANT ALL PRIVILEGES ON $MARIA_DB.* TO '$MARIA_DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

exec mysqld --datadir=/var/lib/mysql