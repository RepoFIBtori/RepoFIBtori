#include <iostream>
using namespace std;

//P57404
//pre: sequencia naturals m > 0.
//post: nombres poderosos entre 1 i m, separats per comes i creixents.

bool es_poderos (int n) {
	bool poderos = true;

	int i= 2;
	
	while (i <= n and poderos) {
		int cont = 0;
		if (n%i == 0) {
			while (n%i == 0) {
				n = n/i;
				++cont;
			} 
			if (cont < 2) poderos = false;
		}
		++i;
	}
	return poderos;
}

int main () {
	int m;
	while (cin >> m) {
		cout << "1";
		for (int i = 2; i <= m; ++i) {
			if (es_poderos(i)) {
				cout << "," << i;
			}
		}
		cout << endl;
	}

	return 0;
}
