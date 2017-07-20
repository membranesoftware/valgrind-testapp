DOCKERNAME=valgrind-testapp

ifndef BUILDVERSION
BUILDVERSION=latest
endif

all: testapp

testapp: testapp.c
	gcc -g -o testapp testapp.c

clean:
	rm -f testapp valgrind.log

valgrind-run: testapp
	valgrind --log-file=valgrind.log --track-fds=yes --leak-check=full --gen-suppressions=all --leak-resolution=high --num-callers=40 --show-reachable=yes ./testapp
	cat valgrind.log

docker:
	docker build -t $(DOCKERNAME):$(BUILDVERSION) .

run:
	docker run -d --name=$(DOCKERNAME)_$(BUILDVERSION) $(DOCKERNAME):$(BUILDVERSION)

run-bash:
	docker run -it --name=$(DOCKERNAME)_$(BUILDVERSION) $(DOCKERNAME):$(BUILDVERSION) bash

exec-bash:
	docker exec -it $(DOCKERNAME)_$(BUILDVERSION) bash

stop: CONTAINERID=$(shell docker ps -a -q -f name=$(DOCKERNAME))
stop:
	if [ ! -z "$(CONTAINERID)" ]; then docker stop -t 1 $(CONTAINERID); docker rm $(CONTAINERID); fi
