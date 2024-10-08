FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with https://github.com/caddy-dns/godaddy

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
