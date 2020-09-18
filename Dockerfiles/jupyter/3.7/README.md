# Jupyter

Interactive web-based data science development environment, extension ready

## Information

![archlinux](https://github.com/tomy0000000/Docker-Registry/workflows/archlinux/badge.svg)

| Configurations    |                            |
| ----------------- | -------------------------- |
| Base Image        | `python:3.7`               |
| Container Name    | `awesome-jupyter`          |
| Volumes           | `.` → `/home/jupyter/data` |
| Network           |                            |
| Working Directory | `/home/jupyter`            |
| Expose Port       | `8888`                     |

## Install

* Build the Dockerfile

```bash
docker build --tag tomy0000000/jupyter .
```

* Start Container

```bash
docker run --rm \
		--name "awesome-jupyter" \
		--publish "8888:8888" \
		--env "AWESOME_PASSWORD=your-awesome-password" \
		--volume "$PWD:/home/jupyter/data" \
		tomy0000000/jupyter:3.7-1.0
```

## Usage

Access jupyter web interface from http://localhost:8888


## Custom Setting

### Applied

* 

### Runtime

* Bind host's runtime directory to container's home directory

### Host Machine

* 

## References

* [Base Image Reference](https://hub.docker.com/_/python)
