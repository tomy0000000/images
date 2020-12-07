#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

add-apt-repository ppa:deadsnakes/ppa
apt update
apt install -y python${PYTHON_VERSION}

if [ ${UBUNTU_VERSION} == "18.04" ] && [ ${PYTHON_VERSION} == "3.6" ]
then
    apt install -y python${PYTHON_VERSION}-distutils
elif [ ${UBUNTU_VERSION} == "20.04" ] && [ ${PYTHON_VERSION} == "3.8" ]
then
    apt install -y python${PYTHON_VERSION}-distutils
else
    if [ ${UBUNTU_VERSION} == "16.04" ] && [ ${PYTHON_VERSION} == "3.8" ]
    then
        apt install -y python${PYTHON_VERSION}-distutils
    elif [ ${UBUNTU_VERSION} == "18.04" ] && [ ${PYTHON_VERSION} == "3.8" ]
    then
        apt install -y python${PYTHON_VERSION}-distutils
    fi
    
    update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 1
    update-alternatives --config python
    update-alternatives --set python /usr/bin/python${PYTHON_VERSION}
fi

curl https://bootstrap.pypa.io/get-pip.py | sudo -H python
