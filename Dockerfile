FROM node:lts-alpine
RUN apk add git openssl build-base make
WORKDIR /usr/src
RUN git clone https://github.com/louislam/uptime-kuma .
RUN git checkout
