#include <iostream>
using namespace std;

//P96965
//pre: x un natural.
//post: retornar suma digits.

int suma_digits (int x) {
	if (x < 10) return x;
	return suma_digits(x/10) + x%10;
}

int reduccio_digits (int x) {
	if (suma_digits(x) < 10) return suma_digits(x);
	return (reduccio_digits(suma_digits(x)));
}

int main () {
	int x;
	while (cin >> x) {
		cout << reduccio_digits(x) << endl;
	}
	return 0;
}