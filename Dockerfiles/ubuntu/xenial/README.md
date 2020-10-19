# Ubuntu Xenial

The popular Linux distribution based on Debian, as a development runtime.

## Information

![ubuntu](https://github.com/tomy0000000/Docker-Registry/workflows/Ubuntu%20Xenial/badge.svg)

| Configurations    |                                                       |
| ----------------- | ----------------------------------------------------- |
| Base Image        | `ubuntu:xenial`                                       |
| Container Name    | `awesome-ubuntu`                                      |
| Volumes           | `.` → `/home/$USER/host`                              |
| Network           |                                                       |
| Working Directory | `/` for dockerfile<br />`/home/$USER` for login shell |
| Expose Port       | `22` → `220`                                          |

## Install

* Pull from hub

```bash
docker pull tomy0000000/ubuntu:xenial
```

* Build from source

```bash
docker build --tag tomy0000000/ubuntu:xenial .
```

## Usage

* Run a temporary playground container (remove on exit)

```bash
docker run \
		-it --rm \
		--name="$AWESOME_HOST-ubuntu" \
		--hostname="$AWESOME_HOST-ubuntu" \
		--env="AWESOME_USER" \
		--env="AWESOME_PASSWORD" \
		--volume="$PWD:/home/$AWESOME_USER/host" \
		tomy0000000/ubuntu:xenial
```

* Run a detached container with SSH server

```bash
docker run \
		-it --rm \
		--name="awesome-ubuntu" \
		--hostname="$AWESOME_HOST-ubuntu" \
		--env="AWESOME_USER" \
		--env="AWESOME_PASSWORD" \
		--publish "127.0.0.1:220:22" \
		--volume="$PWD:/home/$AWESOME_USER/host" \
		tomy0000000/ubuntu:xenial
```


## Custom Setting

### Applied

* Pre-install `curl`, `git`, `openssh-server`, `sudo`, `wget`, `zsh` from apt
* Pre-install `Oh My Zsh`, `powerlevel10k`
* Change default shell to zsh
* Custom `zshrc`, `.p10k.zsh`

### Runtime

* Create new user
* Bind host's runtime directory to container's home directory

### Host Machine

* (None)

## References

* [Base Image Reference](https://hub.docker.com/_/ubuntu)
* [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh#unattended-install)
* [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
