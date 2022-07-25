ARG BASE_TAG="latest"
FROM postgres:${BASE_TAG}

LABEL tech.tomy.docker="postgres-backup-dropbox"
LABEL maintainer="Tomy Hsieh @tomy0000000"

WORKDIR /root

# Install dbxcli
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists && \
    wget https://github.com/dropbox/dbxcli/releases/download/v3.0.0/dbxcli-linux-amd64 \
    -O /usr/local/bin/dbxcli && \
    chmod +x /usr/local/bin/dbxcli

# Copy scripts
COPY scripts/* ./

ENTRYPOINT [ "/bin/bash", "backup.sh" ]
