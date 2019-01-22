#include <iostream>
using namespace std;

//P48025
//pre: sequencia de casos, cada cas comença amb un natural n,
//     seguit d' n naturals.
//post: quants dels naturals acaben en 42.

int main () {
	int n, nx, j = 1;
	while (cin >> n) {
		int cont = 0;
		for (int i = 0; i < n; ++i) {
			cin >> nx;
			if (nx%100 == 42) {
				++cont; 
			} 
		}
		cout <<"#"<< j << ": " << cont << endl;
		++j; 
	}
	return 0;
}
