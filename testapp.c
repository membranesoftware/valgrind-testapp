#include <stdlib.h>

int main (int argc, char **argv) {
	int len, *array;

	len = 8;
	array = (int *) malloc (len * sizeof (int));

	// TODO: Free this array (currently leaving a leak for detection by valgrind)
	// free (array);

	exit (0);
}
