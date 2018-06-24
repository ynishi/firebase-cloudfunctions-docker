FROM node:6.14.0

RUN set -eux; \
    npm install -g \
        firebase-tools \
        js-beautify \
        typescript; \
    \
    firebase --version; \
    tsc --version

RUN mkdir /project
WORKDIR /project/
