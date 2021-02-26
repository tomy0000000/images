#!/bin/bash
sudo -i -u "${AWESOME_USER:-user}" jupyter lab --ip="*" > /var/log/jupyterlab.log 2>&1 &
echo "Jupyter Lab Started!"
