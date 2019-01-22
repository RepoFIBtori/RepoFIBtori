#include <iostream>
#include <cmath>
using namespace std;

//P48713
//pre: nombre n, seguit de n naturals.
//post: escriure si es primer o no.

bool primer (int n) {
	if (n <= 1) return false;
	for (int i = 2; i <= sqrt(n); ++i) {
		if (n%i == 0) return false;
	}
	return true;
}


int main () {
	int n;
	cin >> n;
	for (int i = 0; i < n; ++i) {
		int x;
		cin >> x;
		if (primer(x)) cout << x << " es primer" << endl;
		else cout << x << " no es primer" << endl;
	}
	return 0;
}
