#!/bin/bash

# Install Node
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
apt install -y nodejs

# Install Jupyter Lab
pip install jupyterlab

# Setup Password
python -c "import os; from notebook.auth.security import set_password; set_password(os.getenv('AWESOME_PASSWORD', 'password'))"

# Activate Service
jupyter lab --ip="*" --allow-root > /var/log/jupyterlab.log 2>&1 &

echo "Jupyter Lab Installed and Started!"
