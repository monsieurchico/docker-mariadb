# Mariadb image

## Requirements

You must have [Docker](https://www.docker.com/) >= 1.5.

## What's inside

* [latest ubuntu](https://github.com/dockerfile/ubuntu)
* [latest mariadb 10](https://downloads.mariadb.org/)

### Configuration

### Ports

You can bind ports :

* 3306

### Volumes

You can mount directories :

* /etc/mysql : conf

### Encoding

Here is the mariadb.cnf configuration :

```ini
[client]
default-character-set = utf8

[mysqld]
character-set-server  = utf8
collation-server      = utf8_general_ci
character_set_server   = utf8
collation_server       = utf8_general_ci
```

## Usage

```bash
# pull (auto) and run
docker run \
    -d \
    --name db \
    -p 3306:3306 \
    monsieurchico/mariadb
```
