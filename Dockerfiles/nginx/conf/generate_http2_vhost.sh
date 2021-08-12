#!/bin/bash
set -eu

export DOMAIN=${1}
envsubst '${DOMAIN}' < "conf.d/http2.conf.template" > "conf.d/${DOMAIN}.conf"
cp -r "/usr/share/nginx/html/default" "/usr/share/nginx/html/${DOMAIN}"

openssl req -x509 -newkey rsa:4096 -sha256 -nodes \
    -keyout "ssl/${DOMAIN}.key" \
    -out "ssl/${DOMAIN}.crt" \
    -config "ssl.conf"
echo "SSL certificate for ${DOMAIN} has generated, make sure to replace them"
