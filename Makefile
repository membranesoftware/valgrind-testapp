all: testapp

testapp: testapp.c
	gcc -g -o testapp testapp.c

clean:
	rm -f testapp valgrind.log

valgrind-run: testapp
	valgrind --log-file=valgrind.log --track-fds=yes --leak-check=full --gen-suppressions=all --leak-resolution=high --num-callers=40 --show-reachable=yes ./testapp
	cat valgrind.log
