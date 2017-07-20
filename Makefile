all: testapp

testapp: testapp.c
	gcc -o testapp testapp.c

clean:
	rm -f testapp
