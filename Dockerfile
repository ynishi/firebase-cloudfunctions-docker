FROM node

RUN npm install -g firebase-tools

RUN mkdir /project
RUN chown node:node /project

USER node
RUN mkdir ~node/.config 
WORKDIR /project/
