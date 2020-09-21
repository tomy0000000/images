# Jupyter

Interactive web-based data science development environment, extension ready

## Information

![Jupyter 3.7](https://github.com/tomy0000000/Docker-Registry/workflows/Jupyter%203.7/badge.svg)

| Configurations    |                            |
| ----------------- | -------------------------- |
| Base Image        | `python:3.7`               |
| Container Name    | `awesome-jupyter`          |
| Volumes           | `.` → `/home/jupyter/data` |
| Network           |                            |
| Working Directory | `/home/jupyter`            |
| Expose Port       | `8888`                     |

## Install

* Start Container

```bash
docker run --rm \
		--name "awesome-jupyter" \
		--env "AWESOME_PASSWORD=$AWESOME_PASSWORD" \
		--publish "8888:8888" \
		--volume "$PWD:/home/jupyter/data" \
		tomy0000000/jupyter:3.7-1.0
```

## Usage

Access jupyter web interface from http://localhost:8888


## Custom Setting

### Applied

* Upgrade `pip` to latest version
* Install community-contributed notebook extensions (0.5.1) and configurator (0.4.1)
* Bind server ip to `0.0.0.0:8888`
* Create new user `jupyter` to startup server

### Runtime

* Setup password from environment variable `AWESOME_PASSWORD`
* Bind host's runtime directory to container's data directory

### Host Machine

* 

## References

* [Base Image Reference](https://hub.docker.com/_/python)
* [Docs of Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable)
* [Docs of Jupyter Notebook Extensions](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest)
