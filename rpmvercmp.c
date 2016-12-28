#include <stdio.h>
/* #include <rpmevr.h> */

/* extern int (*rpmvercmp) (const char *a, const char *b); */
int rpmvercmp(const char *a, const char *b);

int main(int argc, char *argv[]) {
	int rc;
	if (argc < 3) {
		fprintf(stderr, "usage: %s a b [operator]\n", argv[0]);
		return 2;
	}
	rc = rpmvercmp(argv[1], argv[2]);
	if (argc == 3) {
		printf("%d\n", rc);
		return 0;
	}
	switch(argv[3][0]) {
	default:
		fprintf(stderr, "bad operator: %s\n", argv[3]);
		return 2;
	case '<':
		rc = -rc;
	case '>':
		if (argv[3][1] == '=' && rc == 0) {
			return 0;
		}
		return rc <= 0;
	case '=':
		return rc != 0;
	}
}
