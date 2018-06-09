.PHONY: build init update bash deploy

build:
	docker build -t node-firebase .

init:
	sh firebase-init.sh

update:
	docker run --rm -i -t -v $$(pwd):/project -v $$(pwd)/dot.config:/home/node/.config -w /project/functions node-firebase npm install firebase-functions@latest firebase-admin@latest --save
	docker run --rm -i -t -u root -v $$(pwd):/project -v $$(pwd)/dot.config:/home/node/.config -w /project/functions node-firebase npm install -g firebase-tools 

deploy:
	docker-compose run firebase-cf firebase deploy --only functions

bash:
	docker run --rm -i -t -v $$(pwd):/project -v $$(pwd)/dot.config:/home/node/.config node-firebase bash
