#!/bin/bash

username="${AWESOME_USER:-user}"
password="${AWESOME_PASSWORD:-password}"

# Install Code Server
sudo -i -u "${username}" "curl -fsSL https://code-server.dev/install.sh | sh"

# Create Config
mkdir -p ~/.config/code-server
echo "bind-addr: 0.0.0.0:8080
auth: password
password: ${password}
cert: false" > ~/.config/code-server/config.yaml
chown "${username}:${username}" -R "/home/${username}/.config/code-server"

# Move startup script directory
mv code_server_start.sh init.d/

# Start Service
init.d/code_server_start.sh
