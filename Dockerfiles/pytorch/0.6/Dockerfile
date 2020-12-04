ARG UBUNTU_VERSION="18.04"
ARG CUDA_VERSION="11.0"
FROM nvidia/cuda:${CUDA_VERSION}-base-ubuntu${UBUNTU_VERSION}
ARG UBUNTU_VERSION
ARG CUDA_VERSION
ARG PYTHON_VERSION="3.8"
ARG PYTORCH_VERSION="1.7.0"

LABEL tech.tomy.docker.pytorch="0.6"
LABEL maintainer="Tomy Hsieh @tomy0000000"

WORKDIR /root
VOLUME ["/home"]

# Install basic toolchains
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
    curl \
    git \
    software-properties-common \
    sudo \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Python from deadsnakes
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y python${PYTHON_VERSION} \
    && update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 1 \
    && update-alternatives --config python \
    && update-alternatives --set python /usr/bin/python${PYTHON_VERSION} \
    && curl https://bootstrap.pypa.io/get-pip.py | sudo -H python

# Place Scripts
COPY scripts/* ./

# Install PyTorch
RUN ./pytorch_install.sh

ENTRYPOINT ["/root/entrypoint.sh"]
