# Ubuntu Focal

The popular Linux distribution based on Debian, as a development runtime.

## Information

![ubuntu](https://github.com/tomy0000000/Docker-Registry/workflows/ubuntu/badge.svg)

| Configurations    |                         |
| ----------------- | ----------------------- |
| Base Image        | `ubuntu:focal`          |
| Container Name    | `awesome-ubuntu`        |
| Volumes           | `.` → `/home/$(whoami)` |
| Network           |                         |
| Working Directory | `/`                     |
| Expose Port       |                         |

## Install

* Build the Dockerfile

```bash
docker build --tag tomy0000000/ubuntu:focal .
```

* Start Container

```bash
docker run \
		-it --rm \
		--name="some-ubuntu" \
		--volume="$PWD:/home/$USER" \
		tomy0000000/ubuntu:focal bash
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
