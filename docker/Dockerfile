FROM node:6.14.0

ENV FIREBASE_VERSION 4.0.3
ENV TAG_VERSION 6.14.0-${FIREBASE_VERSION}

RUN set -eux; \
    yarn global add \
        firebase-tools@${FIREBASE_VERSION} \
        js-beautify \
        typescript \
    && firebase --version \
    && tsc --version

RUN set -eux; \
  mkdir /project
WORKDIR /project

CMD ["firebase"]
