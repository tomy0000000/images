# NGINX

NGINX Web Server, http2 + SSL + Security Header + gzip compression configured, production ready

## Information

![GitHub Action](https://github.com/tomy0000000/Docker-Registry/workflows/nginx/badge.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/tomy0000000/nginx?logo=docker)

| Configurations    |                                                              |
| ----------------- | ------------------------------------------------------------ |
| Base Image        | `nginx` (Version is dynamically updated by Dependabot)       |
| Working Directory | `/etc/nginx`                                                 |
| Expose Port       | `80`, `443`                                                  |
| Container Name    | `awesome-nginx`                                              |
| Network           | `proxy_bridge`                                               |
| Volumes           | `/etc/nginx/conf.d`<br/>`/etc/nginx/ssl`<br/>`/usr/share/nginx/html` |

## Build (Optional, for generating fresh dhparam)

```bash
docker build --tag tomy0000000/nginx .
```

## Usage

### Run Container

* Docker Compose

```bash
docker-compose up --detach
```

* Dockerfile

```bash
docker run \
    --detach \
    --publish 80:80 \
    --publish 443:443 \
    --name awesome-nginx \
    tomy0000000/nginx
```

### Virtual Host Configs

*Make sure to perform syntax check and reload config after configs are placed*

| Function                                           | Command                                                      |
| -------------------------------------------------- | ------------------------------------------------------------ |
| Generate (http1)                                   | `docker exec -it awesome-nginx ./generate_http1_vhost.sh "example.com"` |
| Generate (http2+SSL)                               | `docker exec -it awesome-nginx ./generate_http2_vhost.sh "example.com"` |
| Custom                                             |                                                              |

### Place static content

```shell
docker cp /content_dir/path/on/host:/usr/share/nginx/html/$DOMAIN
```

### Maintenance

| Function                                         | Command                                  |
| ------------------------------------------------ | ---------------------------------------- |
| Access container shell                           | `docker exec -it awesome-nginx bash`     |
| Perform config syntax check                      | `docker exec -it awesome-nginx nginx -t` |
| Reload config<br />(without downtime)            | `docker kill --signal HUP awesome-nginx` |
| Restart whole container<br />(downtime expected) | `docker restart awesome-nginx`           |

## Custom Setting

### Applied

* Modify some file structure for simplicity, see [Runtime](#Runtime).
* Install OpenSSL and generate dhparam
* Apply Custom Configurations from [NGINX Config](https://www.digitalocean.com/community/tools/nginx)

### Runtime

* Bind the following files/directories to host machine

| Description                | Container Path          |
| -------------------------- | ----------------------- |
| server configuration       | `/etc/nginx/nginx.conf` |
| virtual host configuration | `/etc/nginx/conf.d`     |
| SSL certificates           | `/etc/nginx/ssl`        |
| static contents            | `/usr/share/nginx/html` |

### Host Machine

* (None)

## References

* [Base Image Reference](https://hub.docker.com/_/nginx)
* [Tips for Deploying NGINX (Official Image) with Docker](https://www.docker.com/blog/tips-for-deploying-nginx-official-image-with-docker/)
* [NGINX Config](https://www.digitalocean.com/community/tools/nginx)