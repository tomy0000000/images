# Redis 6.0

Development-Ready Redis, passwordless.

## Information

| Configurations |                 |
| -------------- | --------------- |
| Base Image     | `redis:6.0`     |
| Container Name | `awesome-redis` |
| Volumes        |                 |
| Network        |                 |
| Expose Port    | `6379`          |

## Install

* Run with Docker Compose

```bash
docker-compose up --detach
```

* Run with Docker Compose built from source

```bash
docker-compose \
    --file docker-compose-build.yml \
    up --detach --build
```

* Run with Dockerfile

```bash
docker run \
    --detach \
    --publish="6379:6379" \
    --sysctl="net.core.somaxconn=511" \
    --name="awesome-redis" \
    tomy0000000/redis:6.0
```

* Run with Dockerfile built from source

```bash
docker build --tag tomy0000000/redis:6.0 .
docker run \
    --detach \
    --publish="6379:6379" \
    --sysctl="net.core.somaxconn=511" \
    --name="awesome-redis" \
    tomy0000000/redis:6.0
```

## Usage

* Connect to Redis via URL Connection

```
redis://localhost:6379
```

* Connect to Redis via host machine CLI

```bash
# CLI should be install on Host machine
redis-cli
```

* Connect to Redis via container CLI

```bash
docker exec -it awesome-redis redis-cli
```

## Custom Setting

### Applied

* Bind to `0.0.0.0`
* Expose `6379` port to host machine
* Disable Protected mode

### Runtime

* fix `WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.` (R.1)
  * `--sysctl net.core.somaxconn=511` flag in `docker run` command
  * `sysctls: -net.core.somaxconn=511` options in `docker-compose.yml`

### Host Machine

* (Optional) fix `WARNING overcommit_memory is set to 0` (H.1)

```bash
sudo sysctl vm.overcommit_memory=1
```

* (Optional) fix `WARNING you have Transparent Huge Pages (THP) support enabled in your kernel.` (H.2)

```bash
# macOS
screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag

# Linux
sudo echo never > /sys/kernel/mm/transparent_hugepage/enabled
sudo echo never > /sys/kernel/mm/transparent_hugepage/defrag
```

## References

* [Base Image Reference](https://hub.docker.com/_/redis)
* R.1: [GitHub Issue #35](https://github.com/docker-library/redis/issues/35)
* H.1: [GitHub Issue #19](https://github.com/docker-library/redis/issues/19)
* H.2: [GitHub Issue #55](https://github.com/docker-library/redis/issues/55)
