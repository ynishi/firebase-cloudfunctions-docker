#!/bin/sh

# init project
docker-compose run firebase-cf firebase login
docker-compose run firebase-cf firebase init functions

# update
docker-compose run --workdir=/project/functions firebase-cf \
  npm install firebase-functions@latest firebase-admin@latest --save
docker-compose run --user=root --workdir=/project/functions firebase-cf \
  npm install -g firebase-tools

# remove temp image
docker-compose rm --force
