# firebase-cloudfunctions-docker
docker for Firebase and Cloud Functions development
based on official doc https://firebase.google.com/docs/functions/get-started

## Usage
* `docker-compose up` don't create long process. so `docker-compose run` makes temp images.
* recommended `docker-compose rm` to clean temp images or use docker run command directly.
* `dot.config` dir contains firebase login settings, is mounted when docker container run. don't push public.
* user in docker is node.
### build image
```
make build
# docker build -t node6-firebase
```
### init project
```
make init
# sh firebase-init.sh
```
### deploy
```
make deploy
# docker-compose run firebase-cf firebase deploy --only functions
```
### update firebase-tools 
```
make update
```

## LICENSE
* MIT, see LICENSE.
