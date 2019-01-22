#include <iostream>
using namespace std;

// P55722
//pre: natural n>=0
//post: retornar el nombre de digits d'n

int nombre_digits (int n) {
	int nd = 1;
	while (n > 9) {
		nd = nd + 1;
		n /= 10;
	}
	return nd;
}
int main () {
	int n;
	while (cin >> n) {
		cout << nombre_digits(n) << endl;
	}
	return 0;
}
