#include <iostream>
#include <vector>
using namespace std;

//P51153
//pre: diverses sequencies, comença amb natural n, seguit d'n naturals.
//post: per cada sequencia, escriure si o no si hi ha dos elements
//      tals que xi+xj sigui un nombre senar.

int main () {
	int n;
	while (cin >> n) {
		vector<int> p(n);
		for (int i = 0; i < n; ++i) cin >> p[i];
		bool odd = false;
		for (int x = 0; x < n; ++x) {
			for (int y = 0; y < n; ++y) {
				if (x != y)	if ((p[x]+p[y])%2 != 0) odd = true;
			}
		}
		if (odd) cout << "si" << endl;
		else cout << "no" << endl;
	}
	return 0;
}
