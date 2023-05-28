FROM ghost:5-alpine

RUN apk add --no-cache git

RUN git clone https://github.com/uvexz/ghost-theme-goods.git /var/lib/ghost/content/themes/goods \
    && chown -R node:node /var/lib/ghost/content/themes/

RUN mkdir -p /var/lib/ghost/content/adapters \
    && git clone https://github.com/egeldenhuys/ghost-cloudflare-r2 /var/lib/ghost/content/adapters/ghost-cloudflare-r2 \
    && chown -R node:node /var/lib/ghost/content/adapters/

EXPOSE 2368
CMD ["node", "current/index.js"]