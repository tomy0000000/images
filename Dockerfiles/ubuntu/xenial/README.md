# Ubuntu Xenial

The popular Linux distribution based on Debian, as a development runtime.

## Information

| Configurations    |                         |
| ----------------- | ----------------------- |
| Base Image        | `ubuntu:xenial`         |
| Container Name    | `awesome-ubuntu`        |
| Volumes           | `.` → `/home/$(whoami)` |
| Network           |                         |
| Working Directory | `/`                     |
| Expose Port       |                         |

## Install

* Build the Dockerfile

```bash
docker build --tag tomy0000000/ubuntu:xenial .
```

* Start Container

```bash
docker run \
		-it --rm \
		--name="some-ubuntu" \
		--volume="$PWD:/home/$USER" \
		tomy0000000/ubuntu:xenial bash
```

## Usage

Current working directory will be mount in `home/host-username`, default working directory will be initialized at root (`/`).


## Custom Setting

### Applied

* 

### Runtime

* 

### Host Machine

* 

## References

* [Base Image Reference](https://hub.docker.com/_/ubuntu)
