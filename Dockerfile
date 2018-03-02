FROM node:9.5-alpine

RUN apk --no-cache --upgrade add jq

RUN mkdir /app
WORKDIR /app

COPY . ./

ENV REVISION=''
ENV NPM_TOKEN=''
