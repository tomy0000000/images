#!/bin/bash

# Install Node
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
apt install -y nodejs

sudo -i -u "${AWESOME_USER:-user}" bash << EOF
    # Install Jupyter Lab & widget
    pip install --upgrade jupyterlab ipywidgets
    
    # Install lab extension for ipywidgets
    jupyter labextension install @jupyter-widgets/jupyterlab-manager
    
    # Setup config & password
    jupyter server --generate-config
    python -c "from jupyter_server.auth.security import set_password; set_password('${AWESOME_PASSWORD:-password}')"
EOF

# Move startup script directory
mv jupyter_start.sh init.d/

# Start Service
init.d/jupyter_start.sh
