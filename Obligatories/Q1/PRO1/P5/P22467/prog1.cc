#include <iostream>
#include <cmath>
using namespace std;

//P22467
//pre: un natural n >= 0.
//post: retornar si es perfecte o no.

int sum (int n) {
	if (n < 10) return n;
	return sum(n/10) + n%10;
}

bool es_primer_perfecte (int n) {
	if (n == 0 or n == 1) return false;
	for (int i = 2; i <= sqrt(n); ++i) {
		if (n%i == 0) return false;
	}
	if (n < 10) return true;
	return es_primer_perfecte(sum(n));
}

int main () {
	int n;
	while (cin >> n) {
		if (es_primer_perfecte(n)) cout << "true" << endl;
		else cout << "false" << endl;
	}
	return 0;
}

