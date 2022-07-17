FROM golang:alpine as cloudflared-builder
RUN apk add build-base git make
WORKDIR /usr/src
RUN git clone https://github.com/cloudflare/cloudflared .
RUN git checkout 2022.7.1
RUN make cloudflared
FROM node:lts-alpine
COPY --from=cloudflared-builder /usr/src/cloudflared /usr/bin/cloudflared
RUN apk upgrade
RUN apk add git
WORKDIR /app
RUN git clone https://github.com/louislam/uptime-kuma .
RUN npm run setup
RUN apk add tini
ENTRYPOINT ["/sbin/tini", "--"]
CMD node server/server.js
