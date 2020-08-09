FROM redis:6.0

LABEL tech.tomy.docker.redis=""
LABEL maintainer="Tomy Hsieh @tomy0000000"
LABEL version="1.1"

WORKDIR /usr/local/etc/redis
EXPOSE 6379

ADD https://raw.githubusercontent.com/antirez/redis/6.0/redis.conf redis.conf

# Disable Binding
# -> binds to deafult address (0.0.0.0)
RUN sed -i "s/^bind/# bind/g" "redis.conf"

# Disable Protected Mode
RUN sed -i "s/^protected-mode yes/protected-mode no/g" "redis.conf"

# Run Server
ENTRYPOINT redis-server "redis.conf"