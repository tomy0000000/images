#!/bin/bash
jupyter lab --ip="*" --allow-root > /var/log/jupyterlab.log 2>&1 &
echo "Jupyter Lab Installed and Started!"
