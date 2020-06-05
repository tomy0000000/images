FROM nginx:1.17

WORKDIR /etc/nginx
EXPOSE 80
EXPOSE 443

# Backup default configurations
RUN cp nginx.conf nginx.conf.backup
RUN cp conf.d/default.conf conf.d/default.conf.backup

# Customize content directory
RUN mkdir /usr/share/nginx/html/default
RUN mv /usr/share/nginx/html/*.html /usr/share/nginx/html/default
RUN echo "<?php\nphpinfo();\n?>" >> /usr/share/nginx/html/default/index.php

# Copy custom configurations
COPY conf/nginx.conf nginx.conf
COPY conf/fastcgi-php.conf fastcgi-php.conf
COPY conf/default.conf conf.d/default.conf
COPY conf/site.conf.template conf.d/site.conf.template
COPY conf/site_ssl.conf.template conf.d/site_ssl.conf.template

# Generate example.com files
ENV DOMAIN="example.com"
RUN envsubst '\${DOMAIN}' < conf.d/site_ssl.conf.template > conf.d/$DOMAIN.conf
RUN cp -r /usr/share/nginx/html/default /usr/share/nginx/html/$DOMAIN

# Install OpenSSL
RUN mkdir ssl
RUN apt update
RUN apt install -y openssl

# Generate dhparam and example ssl certificate
RUN openssl dhparam -out dhparam.pem 2048
COPY conf/ssl.conf ssl.conf
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes \
    -keyout ssl/example.com.key \
    -out ssl/example.com.crt \
    -config ssl.conf
RUN rm ssl.conf
