ARG UBUNTU_VERSION="18.04"
ARG CUDA_VERSION="11.1-cudnn8"
FROM nvidia/cuda:${CUDA_VERSION}-devel-ubuntu${UBUNTU_VERSION}
ARG UBUNTU_VERSION
ARG CUDA_VERSION
ARG PYTHON_VERSION="3.8"
ARG PYTORCH_VERSION="1.8.1"

LABEL tech.tomy.docker="pytorch"
LABEL maintainer="Tomy Hsieh @tomy0000000"

WORKDIR /root
VOLUME ["/home"]

# Install basic toolchains
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    git \
    software-properties-common \
    sudo \
    wget \
    && rm -rf /var/lib/apt/lists

# Place Scripts
COPY scripts/* ./

# Install Python
RUN ./python_install.sh

# Install PyTorch
RUN ./pytorch_install.sh

ENTRYPOINT ["/root/entrypoint.sh"]
