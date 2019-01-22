#include <iostream>
using namespace std;

bool es_equilibrat(int n) {
	int par = 0;
	int sen = 0;
	while (n > 0) {
		par += n%10;
		n /= 10;
		sen += n%10;
		n /= 10;
	}
	return sen == par;
}
