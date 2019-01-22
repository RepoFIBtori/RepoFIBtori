#include <iostream>
#include <vector>
using namespace std;

//P87920
//pre: diversos casos, cada cas es un nombre n >= 1 seguit de n enters.
//post: per cada cas dir si té algun nombre igual a la suma dels altres.

int main () {
	int n;
	while (cin >> n) {
		int suma = 0;
		vector<int> x(n);
		for (int i = 0; i < n; ++i) {
			cin >> x[i];
			suma = suma + x[i];
		}
		bool found = false;
		for (int j = 0; j < n; ++j) {
			if (x[j] == suma - x[j]) found = true;
		}
		if (found) cout << "YES" <<  endl;
		else cout << "NO" << endl;
	}
	return 0;
}
