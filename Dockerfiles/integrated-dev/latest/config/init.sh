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

# Setting Password
sudo -i -u $username python /home/$username/set_password.py $username $password
rm "home/$username/set_password.py"

# JupyterLab
sudo -bi -u $username jupyter lab 2>&1

# Code Server
sudo -bi -u $username code-server 2>&1

# Spawn Shell
# su $username --login

# Hangup this script
sleep infinity
