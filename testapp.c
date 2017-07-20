#include <stdlib.h>

void fn () {
	int len, *array;

	len = 8;
	array = (int *) malloc (len * sizeof (int));

	// TODO: Free this array (currently leaving a leak for detection by valgrind)
	// free (array);
}

int main (int argc, char **argv) {
	fn ();
	exit (0);
}
