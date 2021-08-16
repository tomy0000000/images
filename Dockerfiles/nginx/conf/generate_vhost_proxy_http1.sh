#!/bin/bash
set -eu

export DOMAIN=${1}
export PROXY_LOCATION=${2}
VARS='$DOMAIN:$PROXY_LOCATION'

envsubst "${VARS}" < "conf.d/proxy_http1.conf.template" > "conf.d/${DOMAIN}.conf"
cp -r "/usr/share/nginx/html/default" "/usr/share/nginx/html/${DOMAIN}"
