#!/bin/bash

# Install OpenSSH
apt update
apt install -y openssh-server

# Configure password login
sed -i "s/#   Password/Password/g" /etc/ssh/ssh_config

# Start Service
service ssh start
