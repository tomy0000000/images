FROM ubuntu:xenial

LABEL tech.tomy.docker.ubuntu.xenial="1.1"
LABEL maintainer="Tomy Hsieh @tomy0000000"

WORKDIR /

# Intall curl, git, openssh, sudo, wget, zsh
RUN apt update
RUN apt install -y curl git openssh-server sudo wget zsh

# Configure SSH
RUN sed -i "s/#   Password/Password/g" /etc/ssh/ssh_config

# Change default shell to zsh
RUN chsh -s $(which zsh)

# Install & Setup Oh My Zsh & powerlevel10k
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN cp -r /root/.oh-my-zsh /etc/skel/
COPY config/zshrc /etc/skel/.zshrc
COPY config/p10kzsh /etc/skel/.p10k.zsh

# Copy Init script
COPY init.sh /root/init.sh
RUN chmod +x /root/init.sh

ENTRYPOINT ["/root/init.sh"]
