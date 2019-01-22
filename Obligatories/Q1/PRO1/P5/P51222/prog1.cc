#include <iostream>
using namespace std;

//P51222
//pre:
//post:
int nombre_digits (int n) {
	if (n < 10) return 1;
	return nombre_digits (n/10) + 1;
}

int main () {
	int n;
	while (cin >> n) {
		cout << nombre_digits(n) << endl;
	}
	return 0;
}