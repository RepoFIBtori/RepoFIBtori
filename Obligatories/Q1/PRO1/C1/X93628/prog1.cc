#include <iostream>
using namespace std;

//X93628
//pre: sequencia naturals
//post:escriure nxn taulell d'escacs. Escriure linia en blanc despres de cada un.

int main () {
	int n;
	while (cin >> n) {
		for (int i = 0; i < n; ++i) {
			for (int j = 0; j < n; ++j) {
				if ((i+j)%2 == 0) {
					cout << '.';
				} else {
					cout << 'x';
				}
			}
			cout << endl;
		}
		cout << endl;
	}
	return 0;
}