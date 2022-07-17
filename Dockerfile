FROM node:lts-alpine
RUN apk upgrade
RUN apk add git
WORKDIR /app
RUN git clone https://github.com/louislam/uptime-kuma .
RUN npm run setup
RUN npm install pm2 -g
RUN pm2 install pm2-logrotate
RUN apk add tini
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["pm2", "start", "server/server.js", "--name", "uptime-kuma"]
