# nginx 1.17

nginx web server, http2 + SSL + Security Header + gzip + non-root configured, production ready

## Information

![](https://github.com/tomy0000000/Docker-Registry/workflows/nginx/badge.svg)

| Configurations    |                                                              |
| ----------------- | ------------------------------------------------------------ |
| Base Image        | `nginx:1.17`                                                 |
| Container Name    | `awesome-nginx`                                              |
| Volumes           | `./nginx/nginx.conf` → `/etc/nginx/nginx.conf` (Read-Only)<br/>`./nginx/conf.d` → `/etc/nginx/conf.d` (Read-Only)<br/>`.//nginx/ssl` → `/etc/nginx/ssl` (Read-Only)<br/>`./nginx/html` → `/usr/share/nginx/html` (Read-Only) |
| Network           |                                                              |
| Working Directory | `/etc/nginx`                                                 |
| Expose Port       | `80`, `443`                                                  |

## Install

### Build (Optional, to generate fresh dhparam)

* Docker Compose

```bash
docker-compose \
    --file docker-compose-build.yml \
    up --detach --build
```

* Dockerfile

```bash
docker build --tag tomy0000000/nginx:1.17 .
```

### Init File Structure (Skip if testing)

```bash
# Clone existed file structure to host
mkdir nginx
docker run --name tmp-nginx -d tomy0000000/nginx:1.17
docker cp tmp-nginx:/etc/nginx/nginx.conf nginx/nginx.conf
docker cp tmp-nginx:/etc/nginx/nginx.conf.backup nginx/nginx.conf.backup
docker cp tmp-nginx:/etc/nginx/conf.d nginx/conf.d
docker cp tmp-nginx:/etc/nginx/ssl nginx/ssl
docker cp tmp-nginx:/usr/share/nginx/html nginx/html
docker rm -f tmp-nginx
```

### Run Container

* Docker Compose

```bash
docker-compose up --detach
```

* Dockerfile (**for testing only**, doesn't bind content directory to host)

```bash
docker run \
    --detach \
    --publish 80:80 \
    --publish 443:443 \
    --name awesome-nginx \
    tomy0000000/nginx:1.17
```

* Dockerfile (Uncomment line 5 to connect to php-fpm)

```bash
docker run \
    --detach \
    --publish 80:80 \
    --publish 443:443 \
    # --link awesome-php-fpm \
    --volume="$PWD/nginx/nginx.conf:/etc/nginx/nginx.conf:ro" \
    --volume="$PWD/nginx/conf.d:/etc/nginx/conf.d:ro" \
    --volume="$PWD/nginx/ssl:/etc/nginx/ssl:ro" \
    --volume="$PWD/nginx/html:/usr/share/nginx/html" \
    --name awesome-nginx \
    tomy0000000/nginx:1.17
```

## Usage

### Setup Virtual Host

* Generate http1 Virtual Host Configs

```bash
export DOMAIN=  # Insert your domain name here
envsubst '${DOMAIN}' < nginx/conf.d/site.conf.template > nginx/conf.d/$DOMAIN.conf
cp -r nginx/html/default nginx/html/$DOMAIN
```

* Generate http2+SSL Virtual Host Configs

```bash
export DOMAIN=  # Insert your domain name here
envsubst '${DOMAIN}' < nginx/conf.d/site_ssl.conf.template > nginx/conf.d/$DOMAIN.conf
cp -r nginx/html/default nginx/html/$DOMAIN
```

### Place Static Files

* Place static files under `./nginx/html`

### Control nginx

* Access shell of container

```bash
docker exec -it awesome-nginx bash
```

* Perform syntax check

```bash
docker exec -it awesome-nginx nginx -t
```

* Reload nginx configuration (without downtime)

```bash
docker kill --signal HUP awesome-nginx
```

* Restart whole container (downtime expected)

```bash
docker restart awesome-nginx
```

### Test in Browser

* localhost: http://localhost:80
* exmaple.com: https://exmaple.com:443
  * Add an `127.0.0.1 example.com` entry in `/etc/hosts`
  * The certificate is self-signed, which might not be accepted in browser, but if you bypass or explicitly trurt the certificate, it should worked.

## Custom Setting

### Applied

* Modify some file structure for simplicity, see [Runtime](#Runtime).
* Install OpenSSL and generate dhparam
* Apply Custom Configurations from [NGINX Config](https://www.digitalocean.com/community/tools/nginx)

### Runtime

* Bind the following files/directories to host machine

| Description                | Container Path        | Host Path          |
| -------------------------- | --------------------- | ------------------ |
| server configuration       | /etc/nginx/nginx.conf | ./nginx/nginx.conf |
| virtual host configuration | /etc/nginx/conf.d     | ./nginx/conf.d     |
| SSL certificates           | /etc/nginx/ssl        | ./nginx/ssl        |
| static contents            | /usr/share/nginx/html | ./nginx/html       |

```bash
nginx
├── conf.d # vhost conf
│   ├── default.conf # Custom default
│   ├── default.conf.backup # Official default (as reference, not in used)
│   ├── example.com.conf # genereated with site_ssl.conf.template
│   ├── site.conf.template # exmaple http conf (as reference, not in used)
│   └── site_ssl.conf.template # exmaple https conf (as reference, not in used)
├── html # content directories
│   ├── default # http://localhost:80
│   │   ├── 50x.html
│   │   └── index.html
│   └── example.com # https://exmaple.com:443
│       ├── 50x.html
│       └── index.html
├── nginx.conf # Custom default server conf
├── nginx.conf.backup # Official default server conf (as reference, not in used)
└── ssl # certificates
    ├── example.com.crt
    └── example.com.key
```

### Host Machine

* (None)

## References

* [Base Image Reference](https://hub.docker.com/_/nginx)
* [Tips for Deploying NGINX (Official Image) with Docker](https://www.docker.com/blog/tips-for-deploying-nginx-official-image-with-docker/)
* [NGINX Config](https://www.digitalocean.com/community/tools/nginx)