.PHONY: build init update bash deploy

build:
	docker build -t node6-firebase docker

init:
	sh firebase-init.sh

update:
	docker-compose run -w /project/functions firebase-cf \
		npm install firebase-functions@latest firebase-admin@latest --save
	docker-compose run -w /project/functions firebase-cf \
		npm install -g firebase-tools

addprj:
	docker-compose run firebase-cf firebase use --add

deploy:
	docker-compose run firebase-cf firebase deploy --only functions

serve:
	docker-compose up

test:
	docker-compose run -w /project/functions firebase-cf \
		npm test

fshell:
	docker-compose run -w /project/functions firebase-cf \
		sh -c "firebase functions:config:get > .runtimeconfig.json && \
		       firebase functions:shell"

flog:
	docker-compose run -w /project/functions firebase-cf \
		firebase functions:log

bash:
	docker-compose run firebase-cf bash

clean:
	docker-compose rm

beautify:
	docker-compose run -w /project/functions firebase-cf \
		 js-beautify -r $(FILES) 

installpkg:
	 docker-compose run -w /project/functions firebase-cf \
		 npm install $(ARGS) $(PKGS)
