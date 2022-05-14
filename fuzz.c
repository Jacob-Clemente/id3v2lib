#include "id3v2lib.h"

int main (int argc, char** argv) {
	if (argc > 1)
		load_tag(argv[1]);
	return 0;
}
