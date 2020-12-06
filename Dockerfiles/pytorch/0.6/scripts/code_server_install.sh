#!/bin/bash

# Install Code Server
curl -fsSL https://code-server.dev/install.sh | sh

# Create Config
mkdir -p ~/.config/code-server
echo "bind-addr: 0.0.0.0:8080
auth: password
password: ${AWESOME_PASSWORD:-password}
cert: false" > ~/.config/code-server/config.yaml

# Start Service
./code_server_start.sh
