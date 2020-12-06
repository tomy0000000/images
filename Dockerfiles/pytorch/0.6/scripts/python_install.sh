#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

if [ ${PYTHON_VERSION} == "3.6" ] && [ ${UBUNTU_VERSION} == "18.04" ]
then
    apt install -y \
        python${PYTHON_VERSION} \
        python3-distutils
elif [ ${PYTHON_VERSION} == "3.8" ] && [ ${UBUNTU_VERSION} == "20.04" ]
then
    apt install -y \
        python${PYTHON_VERSION} \
        python3-distutils
else
    add-apt-repository ppa:deadsnakes/ppa
    apt update
    apt install -y python${PYTHON_VERSION}
    # if [ ${UBUNTU_VERSION} == "16.04" ]
    # then
    #     apt install -y python3-distutils-extra
    # else
    #     apt install -y python${PYTHON_VERSION}-distutils
    # fi
    apt install -y python${PYTHON_VERSION}-distutils
    update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 1
    update-alternatives --config python
    update-alternatives --set python /usr/bin/python${PYTHON_VERSION}
    curl https://bootstrap.pypa.io/get-pip.py | sudo -H python
fi
