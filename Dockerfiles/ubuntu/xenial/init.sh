#!/bin/bash

# Create User
username="${AWESOME_USER:-user}"
password="${AWESOME_PASSWORD:-password}"
useradd $username --groups "sudo" --home-dir "/home/$username" --shell $(which zsh)
echo "$username:$password" | chpasswd
cp -r /etc/skel/. "/home/$username"
chown "$username:$username" -R "/home/$username"

# Start SSH server
service ssh start > /dev/null

# Spawn Shell
su $username --login
