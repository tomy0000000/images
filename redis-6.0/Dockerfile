FROM redis:6.0

WORKDIR /usr/local/etc/redis

ADD https://raw.githubusercontent.com/antirez/redis/6.0/redis.conf redis.conf

# Disable Binding
# -> binds to deafult address (0.0.0.0)
RUN sed -i "s/^bind/# bind/g" "redis.conf"

# Disable Protected Mode
RUN sed -i "s/^protected-mode yes/protected-mode no/g" "redis.conf"

# Run on 6379 port
EXPOSE 6379

# Run Server
ENTRYPOINT redis-server "redis.conf"