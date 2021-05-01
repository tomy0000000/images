# PyTorch

A well-packed PyTorch development runtime, CUDA ready.

## Information

![PyTorch](https://github.com/tomy0000000/Docker-Registry/workflows/PyTorch/badge.svg)

| Configurations    |                   |
| ----------------- | ----------------- |
| Base Image        | `nvidia/cuda`     |
| Container Name    | `awesome-pytorch` |
| Volumes           | `$AWESOME_HOST`   |
| Network           |                   |
| Publish Port      |                   |
| Working Directory | `/root`           |

## Install

* Build from source

```bash
docker build \
	--build-arg "UBUNTU_VERSION=18.04" \
	--build-arg "CUDA_VERSION=11.0" \
	--build-arg "PYTHON_VERSION=3.8" \
	--build-arg "PYTORCH_VERSION=1.7.0" \
	--tag tomy0000000/pytorch .
```

## Usage

* Use dedicated user for container

```bash
# Information about container
export AWESOME_USER="username" # username inside container
export AWESOME_PASSWORD=$(openssl rand -base64 48) # password for services
export AWESOME_HOST="hostname" # container name & hostname
export AWESOME_VOLUME="$AWESOME_HOST"

# Create volume
docker volume create $AWESOME_VOLUME

# Spawn container
docker run -d \
	--gpus="all" \
	--name="${AWESOME_HOST}" \
	--hostname="${AWESOME_HOST}" \
	--env="AWESOME_USER" \
	--env="AWESOME_PASSWORD" \
	--publish="127.0.0.1:$(shuf -i 0-65535 -n 1):22" \
	--volume="${AWESOME_VOLUME}:/home/${AWESOME_USER}" \
	tomy0000000/pytorch
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

* Pre-install `curl`, `git`, `sudo`, `wget` from apt
* Scripts to install OpenSSH Server, JupyterLab, and Code Server

### Runtime

* Create new user
* Bind host's runtime directory to container's home directory

### Host Machine

* (None)

## Draft

- [ ] Service healthchecks
- [ ] Change environment variables to [build secret](https://docs.docker.com/develop/develop-images/build_enhancements/#new-docker-build-secret-information)

## References

* [Base Image Reference](https://hub.docker.com/r/nvidia/cuda)
* [Python deadsnakes PPA](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa)
* [CUDA image tag list](https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md)
* [PyTorch wheels list](https://download.pytorch.org/whl/torch_stable.html)
* [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/index.html)
* [JupyterServer](https://jupyter-server.readthedocs.io/en/latest/)
* [Code Server](https://github.com/cdr/code-server)

