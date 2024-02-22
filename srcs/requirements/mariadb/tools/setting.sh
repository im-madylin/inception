#!/bin/bash

mysql_install_db --datadir=/var/lib/mysql

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MARIA_DB;
CREATE USER '$MARIA_DB_USER'@'%' IDENTIFIED BY '$MARIA_DB_USER_PW';
GRANT ALL PRIVILEGES ON $MARIA_DB.* TO '$MARIA_DB_USER'@'%';
ALTER USER '$MARIA_DB_ROOT'@'localhost' IDENTIFIED BY '$MARIA_DB_ROOT_PW';
FLUSH PRIVILEGES;
EOF

exec mysqld --datadir=/var/lib/mysql