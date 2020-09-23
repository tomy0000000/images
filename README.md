# Docker Registry
This is a [mirror](https://hub.docker.com/u/tomy0000000) repository collecting my custom docker images.

Please read through this main README and the one inside each directory if you were to use any of them.

Unless explicitly stated, most images are for **development purpose** only, they're supposed to be quick and dirty, and had some security concerns to some extent. Therefore, do not use them in production environment.

## Installation

Most image (service) comes in two format, `Dockerfile` and `Docker Compose`.

Generally, Dockerfile is designed as a simple development runtime. Whereas Docker Compose is designed to managed / visualized complicated configuration, in addition, `restart=always` flag enables the container to daemonized as services.

Many of the dockerfile make use of the `AWESOME_PASSWORD` environment variable, for shell password in linux distributions, or admin password in databases. Adding the following line in your `.bashrc`, `.zshrc`, `config.fish`, or other login source config can help speed up the process using images from this repo.

```bash
# Please don't blindly copy, type your own password
# or generate one with `openssl rand -base64 48`
export AWESOME_PASSWORD="8TlZNbT1HENkIkdnzFry+KbOYWVl/uwY207bRIgpOO6/qqV+8qtP9EHbfDUl0ZyF"
```

Consult each README for detailed usage.

## Custom Setting

Custom setting comes in three type: `Applied`, `Runtime`, `Host Machine`.

The following chart indicate which type of settings is handled using different approach.

|              | Dockerfile | Docker Compose |
| ------------ | ---------- | -------------- |
| Applied      | ✅          | ✅              |
| Runtime      | ❌*         | ✅              |
| Host Machine | ❌          | ❌              |

\**Runtime settings is not handled in Dockerfile, but can be handle using command given in README*

If not specified, settings is required by default. Therefore, if your installation method doesn't handle correctly, unexpected results might happened.
