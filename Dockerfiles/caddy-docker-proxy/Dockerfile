ARG BASE_TAG="latest"
FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:${BASE_TAG}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY --from=1password/op:2 /usr/local/bin/op /usr/local/bin/op

# Resolves op:// references in the environment when OP_SERVICE_ACCOUNT_TOKEN is set
ENTRYPOINT ["op", "run", "--"]
CMD ["caddy", "docker-proxy"]
