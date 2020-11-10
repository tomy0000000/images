FROM nvidia/cuda:11.1-base-ubuntu18.04

LABEL tech.tomy.docker.integrated-dev="2.0"
LABEL maintainer="Tomy Hsieh @tomy0000000"

WORKDIR /root

# Install basic toolchains
RUN apt update
RUN apt install -y curl git openssh-server software-properties-common sudo wget

# Install Python 3.8 from deadsnakes
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.8 python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN update-alternatives --config python
RUN update-alternatives --set python /usr/bin/python3.8
RUN python -m pip install --upgrade pip

# Install PyTorch
RUN pip install torch==1.7.0+cu110 -f https://download.pytorch.org/whl/torch_stable.html

# Configure SSH
RUN sed -i "s/#   Password/Password/g" /etc/ssh/ssh_config

# Install Oh My Zsh
# RUN chsh -s $(which zsh)
# /root/.oh-my-zsh
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install powerlevel10k
# /root/.oh-my-zsh/custom/themes/powerlevel10k
# RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy everything to /etc/skel for init script to copy
# RUN cp -r /root/.oh-my-zsh /etc/skel/
# COPY config/zshrc /etc/skel/.zshrc
# COPY config/p10kzsh /etc/skel/.p10k.zsh

# Place Scripts
COPY config/init.sh .
COPY config/install_jupyter.sh .
COPY config/install_code_server.sh .

ENTRYPOINT ["/root/init.sh"]
