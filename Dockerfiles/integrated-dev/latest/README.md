# Integrated Dev

A well-packed integrated development runtime.

## Information

![ubuntu](https://github.com/tomy0000000/Docker-Registry/workflows/Ubuntu%20Xenial/badge.svg)

| Configurations    |                                                              |
| ----------------- | ------------------------------------------------------------ |
| Base Image        | `ubuntu:bionic`                                              |
| Container Name    | `awesome-intdev`                                             |
| Volumes           | `.` → `/home/$USER/host`                                     |
| Network           |                                                              |
| Working Directory | `/` for dockerfile<br />`/home/$USER` for login shell        |
| Expose Port       | `22` → `220` (OpenSSH)<br />`8888`→ `8888` (Jupyter Lab)<br />`8080`→ `8080` (Code Server) |

## Build (Optional)

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
		--env="AWESOME_USERNAME=${AWESOME_USERNAME:-user}" \
		--env="AWESOME_PASSWORD=${AWESOME_PASSWORD:-password}" \
		--publish "127.0.0.1:220:22" \
		--publish "127.0.0.1:8080:8080" \
		--publish "127.0.0.1:8888:8888" \
		--volume="$PWD:/home/$AWESOME_USER/host" \
		tomy0000000/integrated-dev:1.0
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
