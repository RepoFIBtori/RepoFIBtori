#include <iostream>
using namespace std;

//P29253
//pre: l'entrada consisteix en diversos nombres romans acabats en un punt.
//post: escriure el seu valor.

int roma (int c) {
	if (c == 'I') return 1;
	if (c == 'V') return 5;
	if (c == 'X') return 10;
	if (c == 'L') return 50;
	if (c == 'C') return 100;
	if (c == 'D') return 500;
	if (c == 'M') return 1000;
	return 0;
}

int main () {
	char c1;
	while (cin >> c1) {
		int num = 0;
		char c;
		bool new_c = false;
		while (c1 != '.') {
			cout << c1;
			cin >> c;
			if (new_c) new_c = false;
			else if (roma(c1) < roma(c)) {
				num = num + roma(c) - roma(c1);
				new_c = true;
			} else num = num + roma(c1);
			c1 = c;
		}
		cout << " = " << num << endl;
	}	
	return 0;
}
