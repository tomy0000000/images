#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Add deadsnake PPA
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install -y "python${PYTHON_VERSION}" "python${PYTHON_VERSION}-dev"

# Manually install distutils for Python 3.8 or Ubuntu-provided Python
# 18.04 (bionic): Python 3.6
# Python 3.8 & Python 3.9
if [[ ( ${UBUNTU_VERSION} == "18.04" && ${PYTHON_VERSION} == "3.6" ) ]] || [[ ${PYTHON_VERSION} == "3.8" ]] || [[ ${PYTHON_VERSION} == "3.9" ]]
then
    apt install -y "python${PYTHON_VERSION}-distutils"
fi

update-alternatives --install /usr/bin/python python "/usr/bin/python${PYTHON_VERSION}" 1
update-alternatives --config python
update-alternatives --set python "/usr/bin/python${PYTHON_VERSION}"

curl https://bootstrap.pypa.io/get-pip.py | sudo -H python
python -m pip install --upgrade pip setuptools wheel

# apt provided requests are mostly troublesome
pip install --upgrade requests
