# Mariadb image

## Requirements

You must have [Docker](https://www.docker.com/) >= 1.5.

## What's inside

* [latest ubuntu](https://github.com/dockerfile/ubuntu)
* [latest mariadb 10](https://downloads.mariadb.org/)

### Ports

You can bind ports :

* 3306

### Volumes

You can mount directories :

* /etc/mysql : conf
* /var/lib/mysql : data

## Usage

```bash
# pull (auto) and run
docker run \
    -p 3306:3306 \
    --name db \
    -d monsieurchico/mysql

# mount volumes
# be careful with the mount point. Depending on the rights, mysql can fail at startup
docker run \
    -p 3306:3306 \
    -v /opt/docker/mysql/data:/var/lib/mysql \
    --name db \
    -d monsieurchico/mysql
```
