# Caddy Docker Proxy

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/tomy0000000/images/caddy-docker-proxy.yml?logo=Github)](https://github.com/tomy0000000/images/actions/workflows/caddy-docker-proxy.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/tomy0000000/caddy-docker-proxy?logo=docker)](https://hub.docker.com/repository/docker/tomy0000000/caddy-docker-proxy)

Caddy that routes, issues certificates and creates Cloudflare DNS records from Docker labels

## Usage

Put the global options in a base `Caddyfile`. The zone line also manages the listed record (`host1.example.com` here), so don't list `@` unless the apex should point at this host:

```caddyfile
{
	acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
	dynamic_dns {
		provider cloudflare {env.CLOUDFLARE_API_TOKEN}
		domains {
			example.com host1
		}
		dynamic_domains
	}
}
```

Then label each container with its site address:

```yaml
services:
  caddy:
    image: tomy0000000/caddy-docker-proxy
    ports:
      - "80:80"
      - "443:443"
    environment:
      CADDY_DOCKER_CADDYFILE_PATH: /etc/caddy/Caddyfile
      CADDY_INGRESS_NETWORKS: caddy
      CLOUDFLARE_API_TOKEN: <api_token>
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./Caddyfile:/etc/caddy/Caddyfile
      - data:/data

  whoami:
    image: traefik/whoami
    labels:
      caddy: whoami.example.com
      caddy.reverse_proxy: "{{upstreams 80}}"

networks:
  default:
    external: true
    name: caddy

volumes:
  data:
```

Obtain token from https://dash.cloudflare.com/profile/api-tokens. The token must have permission to edit Zone `example.com`.

### Secrets from 1Password

The entrypoint is `op run`, which replaces `op://` references in the environment when the container starts. Set a [service account](https://www.1password.dev/service-accounts/) token, and reference the secret instead of pasting it:

```yaml
environment:
  OP_SERVICE_ACCOUNT_TOKEN: ${OP_SERVICE_ACCOUNT_TOKEN}
  CLOUDFLARE_API_TOKEN: op://Develop/Cloudflare API Token/credential
```

Without `OP_SERVICE_ACCOUNT_TOKEN`, plain values pass through unchanged. Restart the container to pick up a rotated secret.

## References

- [Base Image Reference](https://hub.docker.com/_/caddy)
- [GitHub Repository: caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare)
- [GitHub Repository: lucaslorentz/caddy-docker-proxy](https://github.com/lucaslorentz/caddy-docker-proxy)
- [GitHub Repository: mholt/caddy-dynamicdns](https://github.com/mholt/caddy-dynamicdns)
- [1Password CLI: op run](https://www.1password.dev/cli/reference/commands/run/)
