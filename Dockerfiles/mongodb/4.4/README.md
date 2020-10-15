# MongoDB

Document-oriented JSON database.

## Information

![mongo](https://github.com/tomy0000000/Docker-Registry/workflows/Mongo%204.4/badge.svg)

| Configurations    |                   |
| ----------------- | ----------------- |
| Base Image        | `mongo:4.4`       |
| Container Name    | `awesome-mongo`   |
| Volumes           |                   |
| Network           |                   |
| Working Directory | `/`               |
| Expose Port       | `27017` → `27017` |

## Install

* Pull from hub

```bash
docker pull tomy0000000/mongodb:4.4-1.0
```

* Build from source

```bash
docker build --tag tomy0000000/mongodb:4.4-1.0 .
```

## Usage

* Run temporary container for development

```bash
docker run --detach \
		--name="$AWESOME_HOST-mongo" \
		--env="MONGO_INITDB_ROOT_USERNAME=$AWESOME_USER" \
		--env="MONGO_INITDB_ROOT_PASSWORD=$AWESOME_PASSWORD" \
		--publish "27017:27017" \
		tomy0000000/mongodb:4.4-1.0
```


## Custom Setting

### Applied

* (None)

### Runtime

* (None)

### Host Machine

* (None)

## References

* [Base Image Reference](https://hub.docker.com/_/mongo)
