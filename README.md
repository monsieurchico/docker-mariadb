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

## Usage

```bash
# pull (auto) and run
docker run \
    -d \
    --name db \
    -p 3306:3306 \
    monsieurchico/mariadb
```
