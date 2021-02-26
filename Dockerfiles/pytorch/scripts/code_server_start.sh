#!/bin/bash
sudo -i -u "${AWESOME_USER:-user}" code-server > /var/log/code-server.log 2>&1 &
echo "Code Server Started!"
