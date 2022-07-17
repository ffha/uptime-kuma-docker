FROM node:lts-alpine
RUN apk upgrade
RUN apk add git cloudflared
WORKDIR /app
RUN git clone https://github.com/louislam/uptime-kuma .
RUN npm run setup
RUN apk add tini
ENTRYPOINT ["/sbin/tini", "--"]
CMD node server/server.js
