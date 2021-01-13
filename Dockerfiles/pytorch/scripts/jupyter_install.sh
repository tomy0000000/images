#!/bin/bash

# Install Node
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
apt install -y nodejs

# Install Jupyter Lab & widget
pip install --upgrade jupyterlab ipywidgets

# Install lab extension for ipywidgets
jupyter labextension install @jupyter-widgets/jupyterlab-manager

# Setup Password
python -c "import os; from notebook.auth.security import set_password; set_password(os.getenv('AWESOME_PASSWORD', 'password'))"

# Start Service
./jupyter_start.sh
