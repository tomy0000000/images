ARG VERSION="latest"

# Generate dhparam and example ssl certificate
FROM nginx:${VERSION} AS builder
WORKDIR /etc/nginx
RUN apt update && apt-get install -y openssl && \
    openssl dhparam -out dhparam.pem 2048

FROM nginx:${VERSION}

LABEL tech.tomy.docker.nginx=""
LABEL maintainer="Tomy Hsieh @tomy0000000"

WORKDIR /etc/nginx
EXPOSE 80
EXPOSE 443
VOLUME ["/etc/nginx/conf.d", "/etc/nginx/ssl", "/usr/share/nginx/html"]

# Customize content directory
RUN mkdir /usr/share/nginx/html/default && \
    mv /usr/share/nginx/html/*.html /usr/share/nginx/html/default

# Copy custom configurations
COPY nginx.conf .
COPY conf.d conf.d
COPY --from=builder /etc/nginx/dhparam.pem .
