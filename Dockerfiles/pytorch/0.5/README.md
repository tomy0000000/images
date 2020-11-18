# PyTorch

A well-packed, PyTorch development runtime, CUDA ready.

#### V1 Draft

* Apply matrix build
  * Scriptlize Python Installation
  * Scriptlize PyTorch Installation
  * Scriptlize [OpenSSH](https://github.com/linuxserver/docker-openssh-server) Installation
* Optimize volume
* Change environment variables to [build secret](https://docs.docker.com/develop/develop-images/build_enhancements/#new-docker-build-secret-information)
* Minimize dockerfile with scripts

## Information

![PyTorch 0.5](https://github.com/tomy0000000/Docker-Registry/workflows/PyTorch%200.5/badge.svg)

| Configurations    |                                                           |
| ----------------- | --------------------------------------------------------- |
| Base Image        | `nvidia/cuda`                                             |
| Container Name    | `awesome-pytorch`                                         |
| Volumes           | `.` → `/home/$USER/host`                                  |
| Network           |                                                           |
| Publish Port      |                                                           |
| Working Directory | `/host` for dockerfile<br />`/home/$USER` for login shell |

## Install

* Build from source

```bash
docker build --tag tomy0000000/pytorch:0.5 .
```

## Usage (Beta)

* Use dedicated user for container

```bash
# Information about container
export AWESOME_USER="tomy0000000" # username inside container
export AWESOME_PASSWORD=$(openssl rand -base64 48) # password for services
export AWESOME_HOST="viral-hour" # container name & hostname
export AWESOME_VOLUME="$AWESOME_HOST"

# Create volume
docker volume create $AWESOME_VOLUME

# Spawn container
docker run -d \
		--gpus="all" \
		--name="$AWESOME_HOST" \
		--hostname="$AWESOME_HOST" \
		--env="AWESOME_USER" \
		--env="AWESOME_PASSWORD" \
		--publish="localhost::22" \
		--publish="localhost::8080" \
		--publish="localhost::8888" \
		--volume="$AWESOME_VOLUME:/home/$AWESOME_USER" \
		tomy0000000/pytorch:0.5
```

* Clean up process

```bash
# Remove container
docker rm $AWESOME_HOST

# Remove volumes
docker volume rm $AWESOME_VOLUME
```

## Custom Setting

### Applied

* Pre-install `curl`, `git`, `openssh-server`, `sudo`, `wget`, `zsh` from apt
* Scripts to install JupyterLab & Code Server

### Runtime

* Create new user
* Bind host's runtime directory to container's home directory

### Host Machine

* (None)

## References

* [Base Image Reference](https://hub.docker.com/r/nvidia/cuda)
* [CUDA image tag list](https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md)
* [PyTorch wheels list](https://download.pytorch.org/whl/torch_stable.html)
* [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/index.html)
* [Code Server](https://github.com/cdr/code-server)
