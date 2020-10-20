# Integrated Dev

A well-packed integrated development runtime.

#### TODOs

* Remove OpenSSH
* Seperate custom install script
* Componentlize service as build args
* Minimize dockerfile with single sciprt

## Information

![Integrated Dev Latest](https://github.com/tomy0000000/Docker-Registry/workflows/Integrated%20Dev%20Latest/badge.svg)

| Configurations    |                                                              |
| ----------------- | ------------------------------------------------------------ |
| Base Image        | `ubuntu:bionic`                                              |
| Container Name    | `awesome-intdev`                                             |
| Volumes           | `.` → `/home/$USER/host`                                     |
| Network           |                                                              |
| Working Directory | `/` for dockerfile<br />`/home/$USER` for login shell        |
| Expose Port       | `22` → `220` (OpenSSH)<br />`8888`→ `8888` (Jupyter Lab)<br />`8080`→ `8080` (Code Server) |

## Install

* Build from source

```bash
docker build --tag tomy0000000/integrated-dev:1.0 .
```

## Usage

* Run a detached container with SSH server

```bash
docker run -d \
		--name="${AWESOME_HOST:-awesome}-intdev" \
		--hostname="${AWESOME_HOST:-awesome}-intdev" \
		--env="AWESOME_USER" \
		--env="AWESOME_PASSWORD" \
		--publish "127.0.0.1:220:22" \
		--publish "127.0.0.1:8080:8080" \
		--publish "127.0.0.1:8888:8888" \
		--volume="$PWD:/home/$AWESOME_USER/host" \
		tomy0000000/integrated-dev:1.0
```

### Beta

* Use dedicated user for container

```bash
# Add container-user group on host machine
# Run this once and only once per host machine
sudo groupadd "container-user"

# Information about container
export AWESOME_USER="tomy0000000" # username inside container
export AWESOME_PASSWORD=$(openssl rand -base64 48) # password for services
export AWESOME_HOST="exploding-bumper" # container name & hostname
export AWESOME_HUMAN="tomy0000000" # real user who operate the container
export AWESOME_VOLUME="$AWESOME_HOST"

# Create volume
docker volume create $AWESOME_VOLUME

# Spawn contaienr
docker run -d \
		--name="$AWESOME_HOST" \
		--hostname="$AWESOME_HOST" \
		--env="AWESOME_USER" \
		--env="AWESOME_PASSWORD" \
		--publish="8080:8080" \
		--publish="8888:8888" \
		--volume="$AWESOME_VOLUME:/home/$AWESOME_USER" \
		tomy0000000/integrated-dev:latest-1.0

# Create dedicated user on host machine
sudo useradd \
	--comment="$AWESOME_HUMAN" \
	--home-dir="/home/$AWESOME_HOST" \
	--expiredate="2022-12-31" \
	--groups="container-user,docker" \
	--create-home \
	--shell="/bin/bash" \
	$AWESOME_HOST

# Add container attach command to .profile
sudo bash -c "echo -e 'docker exec -it $AWESOME_HOST sh\nexit' >> /home/$AWESOME_HOST/.profile"

# Add user's public key to authorized keys
sudo mkdir -p /home/$AWESOME_HOST/.ssh
sudo bash -c "cat ~/.ssh/user_public_keys/$AWESOME_HUMAN.pub >> /home/$AWESOME_HOST/.ssh/authorized_keys"
```

* Clean up process

```bash
# Remove user on host machine
sudo userdel $AWESOME_HOST --remove

# Remove container
docker rm $AWESOME_HOST

# Remove volumes
docker volume rm $AWESOME_VOLUME
```

## Custom Setting

### Applied

* Pre-install `curl`, `git`, `openssh-server`, `sudo`, `wget`, `zsh` from apt
* Pre-install `Oh My Zsh`, `powerlevel10k`
* Change default shell to zsh
* Pre-install JupyterLab & Code Server

### Runtime

* Create new user
* Bind host's runtime directory to container's home directory

### Host Machine

* (None)

## References

* [Base Image Reference](https://hub.docker.com/_/ubuntu)
* [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#unattended-install)
* [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
* [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/index.html)
* [Code Server](https://github.com/cdr/code-server)
