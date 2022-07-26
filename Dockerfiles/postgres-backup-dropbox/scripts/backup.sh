#!/bin/bash
set -e

# Optional variables
POSTGRES_BACKUP_DROPBOX_DIR=${POSTGRES_BACKUP_DROPBOX_DIR:-/backup}

# Required variables
POSTGRES_HOST=${POSTGRES_HOST:-localhost}
POSTGRES_PORT=${POSTGRES_PORT:-5432}
POSTGRES_USER=${POSTGRES_USER:-postgres}
POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-postgres}
DROPBOX_AUTH_CODE=${DROPBOX_AUTH_CODE:-}

# Write postgres credentials to a file
echo "${POSTGRES_HOST}:${POSTGRES_PORT}:*:${POSTGRES_USER}:${POSTGRES_PASSWORD}" >"${HOME}/.pgpass"
chmod 600 "${HOME}/.pgpass"

# Write dropbox credentials to a file
mkdir -p "${HOME}/.config/dbxcli"
echo "{\"\":{\"personal\":\"${DROPBOX_AUTH_CODE}\"}}" >"${HOME}/.config/dbxcli/auth.json"
chmod 600 "${HOME}/.config/dbxcli/auth.json"

while true; do
    FILENAME="dump_$(date +%d-%m-%Y"_"%H_%M_%S).sql"

    # Dump the database into a file
    pg_dumpall --no-password \
        --host "${POSTGRES_HOST}" \
        --port "${POSTGRES_PORT}" \
        --username "${POSTGRES_USER}" \
        --file "${FILENAME}"

    # Upload the file to Dropbox
    dbxcli put "${FILENAME}" "${POSTGRES_BACKUP_DROPBOX_DIR}/${FILENAME}"

    echo 'Backup complete, sleeping for another hour'
    sleep 3600
done
