#include <iostream>
using namespace std;

//P98996
//pre: caracter c.
//post: numero corresponent a c, si es una lletra, sino indicar que no ho es.

int main () {
	char c;
	cin >> c;
	if (c >= 'a' and c <= 'z') {
		cout << c << " -> " << (c%'a') + 1 << endl;
	} else if (c >= 'A' and c <= 'Z') {
		cout << c << " -> " << (c%'A') + 1 << endl;
	} else {
		cout << c << " -> no es una lletra" << endl;
	}
	return 0;
}
