#include <iostream>
using namespace std;

//P27341
//pre: sequencia de parells enters a i b.
//post: resultat de la suma a³ + (a+1)³ +... + (b-1)³ + b³.

int pow (int n) {
	int pot = 1;
	for (int i = 0; i < 3; ++i) {
		pot = pot*n;
	}
	return pot;
}

int main () {
	int a, b;
	while (cin >> a >>  b) {
		cout << "suma dels cubs entre " << a << " i " << b << ": ";
		int sum = 0;
		for (int i = a; i <= b; ++i) {
			sum = sum + pow(i);
		}
		cout << sum << endl;
	}
	return 0;
}
