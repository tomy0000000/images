#!/bin/bash

# Create user on first run
username="${AWESOME_USER:-user}"
password="${AWESOME_PASSWORD:-password}"
if id "${username}" &>/dev/null; then
    echo "User existed, skip creation"
else
    useradd "${username}" --shell="/bin/bash" --groups="root,sudo" --home-dir="/home/${username}"
    echo "${username}:${password}" | chpasswd
    echo "root:${password}" | chpasswd
    cp -r /etc/skel/. "/home/${username}"
    chown "${username}:${username}" -R "/home/${username}"
    echo "export PATH=\"/home/${username}/.local/bin:"'${PATH}'"\"" >> "/home/${username}/.bashrc"
fi

# Start SSH server
service ssh start > /dev/null

# Run services
mkdir "init.d"
find "init/" -follow -type f -print | sort -V | while read -r f; do
    "$f"
done

# Spawn Shell
# su ${username} --login

# Hangup this script
sleep infinity
