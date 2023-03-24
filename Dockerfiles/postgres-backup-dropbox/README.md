# Postgres Backup to Dropbox

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/tomy0000000/images/postgres-backup-dropbox.yml?logo=Github)](https://github.com/tomy0000000/images/actions/workflows/postgres-backup-dropbox.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/tomy0000000/postgres-backup-dropbox?logo=docker)](https://hub.docker.com/repository/docker/tomy0000000/postgres-backup-dropbox)

Backup a Postgres instance to Dropbox with `dbxcli`

## Usage

### Run one-off backup

```bash
docker run -it --rm --env-file '.env' tomy0000000/postgres-backup-dropbox:15
```

### Add to existing Docker Compose Application

1. Add a `docker-compose.override.yml` to your existing application directory
2. Copy and modify your environment variables in `.env` file
3. Re-Run `docker compose up -d`

### Restore from the created backup

```bash
CONTAINER=''
POSTGRES_USER=''
cat 'backup.sql' | docker exec -i "$CONTAINER" psql -U "$POSTGRES_USER"
```

## References

- [Base Image Reference](https://hub.docker.com/_/postgres)
- [GitHub Repository: dropbox/dbxcli](https://github.com/dropbox/dbxcli)
- [Examples from SimpleBackup](https://simplebackups.com/blog/docker-postgres-backup-restore-guide-with-examples/)
- [Helpful StackOverflow Thread](https://stackoverflow.com/questions/24718706/backup-restore-a-dockerized-postgresql-database)
