#!/bin/bash

# Create User
username="${AWESOME_USERNAME:-user}"
password="${AWESOME_PASSWORD:-password}"
useradd "${username}" --groups "sudo" --home-dir "/home/${username}" --shell "/usr/bin/zsh"
echo "${username}:${password}" | chpasswd

# Start SSH server
service ssh start > /dev/null

# Spawn Shell
su "${username}"
