ARG BASE_TAG="latest"
FROM caddy:builder AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:${BASE_TAG}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
