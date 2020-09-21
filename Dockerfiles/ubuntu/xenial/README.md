# Ubuntu Xenial

The popular Linux distribution based on Debian, as a development runtime.

## Information

![ubuntu](https://github.com/tomy0000000/Docker-Registry/workflows/Ubuntu%20Xenial/badge.svg)

| Configurations    |                         |
| ----------------- | ----------------------- |
| Base Image        | `ubuntu:xenial`         |
| Container Name    | `awesome-ubuntu`        |
| Volumes           | `.` → `/home/$(whoami)` |
| Network           |                         |
| Working Directory | `/`                     |
| Expose Port       |                         |

## Install

* Run a temporary playground container (remove on `exit`)

```bash
docker run \
		-it --rm \
		--name="awesome-ubuntu" \
		--env="AWESOME_USERNAME=$USER" \
		--env="AWESOME_PASSWORD=$AWESOME_PASSWORD" \
		--volume="$PWD:/home/$USER" \
		tomy0000000/ubuntu:xenial
```

* Run a detached container with SSH server

```bash
docker run \
		-it --rm \
		--name="awesome-ubuntu" \
		--env="AWESOME_USERNAME=$USER" \
		--env="AWESOME_PASSWORD=$AWESOME_PASSWORD" \
		--publish "220:22" \
		--volume="$PWD:/home/$USER" \
		tomy0000000/ubuntu:xenial
```



## Usage




## Custom Setting

### Applied

* 

### Runtime

* Bind host's runtime directory to container's home directory

### Host Machine

* 

## References

* [Base Image Reference](https://hub.docker.com/_/ubuntu)
