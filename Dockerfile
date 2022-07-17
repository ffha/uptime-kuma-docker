FROM node:lts-alpine
RUN apk add git openssl build-base make
WORKDIR /usr/src
