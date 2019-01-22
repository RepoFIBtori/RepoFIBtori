#include <iostream>
using namespace std;

//P61930
//pre: n natural estrictament positiu.
//post: retornar si es multiple de 3.

int suma_digits (int n) {
	if (n < 10) return n;
	return suma_digits(n/10) + n%10;
}

bool es_multiple_3 (int n) {
	return suma_digits(n)%3 == 0; 
}

int main () {
	int n;
	while (cin >> n) {
		if (es_multiple_3(n)) cout << "true" << endl;
		else cout << "false" << endl;
	}
	return 0;
}