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

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy Init script
COPY init.sh /root/init.sh
RUN chmod +x /root/init.sh

ENTRYPOINT ["/root/init.sh"]
