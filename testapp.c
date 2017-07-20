#include <stdlib.h>

void fn1 () {
	int len, *array;

	len = 8;
	array = (int *) malloc (len * sizeof (int));

	// TODO: Free this array (currently leaving a leak for detection by valgrind)
	// free (array);
}

void fn2 () {
	int i;

	for (i = 0; i < 1024; ++i) {
		fn1 ();
	}
}

int main (int argc, char **argv) {
	fn1 ();
	fn2 ();
	exit (0);
}
