# Caddy Cloudflare

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/tomy0000000/images/caddy-cloudflare.yml?logo=Github)](https://github.com/tomy0000000/images/actions/workflows/caddy-cloudflare.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/tomy0000000/caddy-cloudflare?logo=docker)](https://hub.docker.com/repository/docker/tomy0000000/caddy-cloudflare)

Caddy with auto certificate management with Cloudflare module

## Usage

Here's a minimal example of `Caddyfile` that automatically generates a certificate for `subdomain.example.com`:

```caddyfile
subdomain.example.com {
    ...
    tls {
        dns cloudflare <api_token>
	}
}
```

Obtain token from https://dash.cloudflare.com/profile/api-tokens. The token must have permission to edit Zone `example.com`.

## References

- [Base Image Reference](https://hub.docker.com/_/caddy)
- [GitHub Repository: caddy-dns/cloudflare](https://github.com/caddy-dns/cloudflare)
