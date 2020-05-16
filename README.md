# Docker Registery
This is a mirror repository collecting my custom docker images.

Please read through this main README and the one inside each directory if you were to use any of them.

Unless explicit stated, most of the images are for **development purpose** only, they're supposed to be quick and dirty, and had some security concerns to some extent. Therefor, do not use them in production environment.

## Installation

All image (service) comes in both two format, `Dockerfile` and `Docker Compose`.

Generally, Docker Compose is widely suggested, but is subject to order of install guide given in each README.

## Custom Setting

Custom setting comes in three type: `Applied`, `Runtime`, `Host Machine`.

The following chart indicate which type of settings is handled using different approach.

|              | Dockerfile | Docker Compose |
| ------------ | ---------- | -------------- |
| Applied      | ✅          | ✅              |
| Runtime      | ❌*         | ✅              |
| Host Machine | ❌          | ❌              |

\**Runtime settings is not handed in Dockerfile, but can be handle using command given in README*

If not specified, settings is required by default. Therefore, if your installation method doesn't handle correctly, unexpected results might happened.

