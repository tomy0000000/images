# PHP-FPM 7.4-nginx

FastCGI implementation for PHP, composer installed, production ready and compatible with [tomy0000000/nginx](https://github.com/tomy0000000/Docker-Registery/tree/master/nginx-1.17)

## Information

| Configurations    |                                                      |
| ----------------- | ---------------------------------------------------- |
| Base Image        | `php:7.4-fpm`                                        |
| Container Name    | `awesome-php-fpm`                                    |
| Volumes           | `./nginx/html` → `/usr/share/nginx/html` (Read-Only) |
| Network           |                                                      |
| Working Directory | `/usr/local/etc/php`                                 |
| Expose Port       | `9000`                                               |

## Install

### Build (Optional)

* Docker Compose

```bash
docker-compose \
    --file docker-compose-build.yml \
    up --detach --build
```

* Dockerfile

```bash
docker build --tag tomy0000000/php-fpm:7.4-nginx .
```

### Init File Structure (Skip if testing)

* Follow instructions from [tomy0000000/nginx](https://github.com/tomy0000000/Docker-Registery/tree/master/nginx-1.17#init-file-structure-skip-if-testing)

### Run Container

* Docker Compose

```bash
docker-compose up --detach
```

* Dockerfile

```bash
docker run \
    --detach \
    --volume="$PWD/nginx/html:/usr/share/nginx/html" \
    --name awesome-php-fpm \
    --sysctl net.ipv4.ip_unprivileged_port_start=0 \
    tomy0000000/php-fpm:7.4-nginx
```

## Usage

* Follow instructions from [tomy0000000/nginx](https://github.com/tomy0000000/Docker-Registery/tree/master/nginx-1.17#usage)

### Control PHP-FPM

* Reload PHP-FPM

```bash
docker kill --signal USR2 awesome-php-fpm
```


## Custom Setting

### Applied

* Install Composer
* Add GD Extension support

### Runtime

* Bind content directory to host machine (to compatible with nginx)

### Host Machine

* (None)

## References

* [Base Image Reference](https://hub.docker.com/_/hello-world)
