FROM node:8-alpine

ENV AWSCLI_VERSION 1.14.59
ENV SERVERLESS_VERSION 1.26

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        zip \
        && \
    pip install awscli==${AWSCLI_VERSION} && \
    apk -v --purge del py-pip && \
    npm install -g serverless@${SERVERLESS_VERSION} && \
    rm /var/cache/apk/*

VOLUME /project
WORKDIR /project