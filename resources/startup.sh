#!/usr/bin/env sh

if [ ! -f "/var/lib/mysql/ibdata1" ]; then
    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db
fi

mysqld_safe