#!/usr/bin/env sh

if [ ! -f "/var/lib/mysql/ibdata1" ]; then
    mysql_install_db
fi

mysqld_safe