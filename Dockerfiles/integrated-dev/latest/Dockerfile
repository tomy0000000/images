FROM ubuntu:bionic

LABEL tech.tomy.docker.integrated-dev="1.0"
LABEL maintainer="Tomy Hsieh @tomy0000000"

WORKDIR /

# Intall basic toolchains
RUN apt update
RUN apt install -y curl git openssh-server software-properties-common sudo wget zsh

# Install Python 3.8 from deadsnakes
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.8 python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN update-alternatives --config python
RUN update-alternatives --set python /usr/bin/python3.8
RUN python -m pip install --upgrade pip

# Install JupyterLab
COPY config/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

# Install Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Configure SSH
RUN sed -i "s/#   Password/Password/g" /etc/ssh/ssh_config
RUN service ssh start

# Change default shell to zsh
RUN chsh -s $(which zsh)

# Install Oh My Zsh
# /root/.oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install powerlevel10k
# /root/.oh-my-zsh/custom/themes/powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy everything to /etc/skel for init script to copy
RUN cp -r /root/.oh-my-zsh /etc/skel/
COPY config/zshrc /etc/skel/.zshrc
COPY config/p10kzsh /etc/skel/.p10k.zsh
COPY config/jupyter_notebook_config.py /etc/skel/.jupyter/jupyter_notebook_config.py
COPY config/config.yaml /etc/skel/.config/code-server/config.yaml
COPY config/set_password.py /etc/skel/set_password.py

# Copy Init script
COPY config/init.sh /root/init.sh
RUN chmod +x /root/init.sh

ENTRYPOINT ["/root/init.sh"]
