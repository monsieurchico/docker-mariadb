#
# Mariadb Dockerfile
# git@github.com:monsieurchico/docker-mariadb.git
#
FROM ubuntu:latest
MAINTAINER Romain Derocle "rderocle@gmail.com"

# prevent debian errors
ENV DEBIAN_FRONTEND noninteractive
ENV DB_VERSION 10.0

# update os and install mariadb
RUN \
    apt-get update && \
    apt-get -y install software-properties-common && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db && \
    echo "deb http://mariadb.mirror.iweb.com/repo/$DB_VERSION/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/mariadb.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
    echo "mysqld_safe &" > /tmp/config && \
    echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
    echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config
    bash /tmp/config && \
    rm -f /tmp/config

# expose ports
EXPOSE 3306

# define mountable volumes
VOLUME ["/etc/mysql"]

# add launch script
COPY ./resources/startup.sh /startup.sh

# define entrypoint
ENTRYPOINT ["/bin/bash", "/startup.sh"]

# define workdir
WORKDIR /etc/mysql
