# Arch Linux

Simple, Lightweight Linux distribution aimed for flexibility

## Information

| Configurations    |                         |
| ----------------- | ----------------------- |
| Base Image        | `archlinux:latest`      |
| Container Name    | `awesome-archlinux`     |
| Volumes           | `.` → `/home/$(whoami)` |
| Network           |                         |
| Working Directory | `/`                     |
| Expose Port       |                         |

## Install

* Build the Dockerfile

```bash
docker build --tag tomy0000000/archlinux .
```

* Start Container

```bash
docker run \
		-it --rm \
		--name="awesome-archlinux" \
		--volume="$PWD:/home/$USER" \
		tomy0000000/archlinux bash
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

* [Base Image Reference](https://hub.docker.com/_/archlinux)
