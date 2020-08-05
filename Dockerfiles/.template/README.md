# Hello World

description

## Information

| Configurations    |                       |
| ----------------- | --------------------- |
| Base Image        | `hello-world:latest`  |
| Container Name    | `awesome-hello-world` |
| Volumes           |                       |
| Network           |                       |
| Working Directory | `/`                   |
| Expose Port       | `80`                  |

## Install

* Run with Docker Compose

```bash
docker-compose up --detach
```

* Run with Docker Compose built from source

```bash
docker-compose up --detach --build
```

* Run with Dockerfile

```bash
docker run \
    --detach \
    --name="awesome-hello-world" \
    tomy0000000/hello-world
```

* Run with Dockerfile built from source

```bash
docker build --tag tomy0000000/hello-world .
docker run \
    --detach \
    --name="awesome-hello-world" \
    tomy0000000/hello-world
```

## Usage




## Custom Setting

### Applied

* 

### Runtime

* 

### Host Machine

* 

## References

* [Base Image Reference](https://hub.docker.com/_/hello-world)
