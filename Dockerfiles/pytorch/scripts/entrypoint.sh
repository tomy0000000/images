#!/bin/bash

# Create User
username="${AWESOME_USER:-user}"
password="${AWESOME_PASSWORD:-password}"
useradd "$username" --no-user-group --groups "root,sudo" --home-dir "/home/$username"
echo "$username:$password" | chpasswd
echo "root:$password" | chpasswd
cp -r /etc/skel/. "/home/$username"
chown "$username:$username" -R "/home/$username"

# Start SSH server
service ssh start > /dev/null

# Spawn Shell
# su $username --login

# Hangup this script
sleep infinity
