#!/bin/bash
set -eu

export DOMAIN=${1}
envsubst '${DOMAIN}' < "conf.d/http1.conf.template" > "conf.d/${DOMAIN}.conf"
cp -r "/usr/share/nginx/html/default" "/usr/share/nginx/html/${DOMAIN}"
