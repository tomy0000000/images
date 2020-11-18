ARG UBUNTU_VERSION=18.04
ARG CUDA_VERSION=11.0
FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu${UBUNTU_VERSION}
ARG CUDA_VERSION
ARG PYTORCH_VERSION=1.7.0
ARG PYTHON_VERSION=3.8

LABEL tech.tomy.docker.pytorch="1.0"
LABEL maintainer="Tomy Hsieh @tomy0000000"

WORKDIR /root
VOLUME ["/home"]

# Install basic toolchains
RUN apt update
RUN apt install -y curl git openssh-server software-properties-common sudo wget

# Install Python from deadsnakes
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python${PYTHON_VERSION} python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 1
RUN update-alternatives --config python
RUN update-alternatives --set python /usr/bin/python${PYTHON_VERSION}
RUN python -m pip install --upgrade pip

# Install PyTorch
RUN pip install torch==1.7.0+cu110 -f https://download.pytorch.org/whl/torch_stable.html

# Configure SSH
RUN sed -i "s/#   Password/Password/g" /etc/ssh/ssh_config

# Place Scripts
COPY script/entrypoint.sh .
COPY script/install_jupyter.sh /etc/skel
COPY script/install_code_server.sh /etc/skel

ENTRYPOINT ["/root/entrypoint.sh"]
