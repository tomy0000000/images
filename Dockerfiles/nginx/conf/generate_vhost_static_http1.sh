#!/bin/bash
set -eu

export DOMAIN=${1}
VARS='$DOMAIN'

envsubst "${VARS}" < "conf.d/static_http1.conf.template" > "conf.d/${DOMAIN}.conf"
cp -r "/usr/share/nginx/html/default" "/usr/share/nginx/html/${DOMAIN}"
