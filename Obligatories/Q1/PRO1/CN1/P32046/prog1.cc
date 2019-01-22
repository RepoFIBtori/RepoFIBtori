#include <iostream>
using namespace std;

//P32046
//pre: sequencia naturals >=100.
//post: escriure els nombres que acabin amb les mateixes 3 xifres
//      que el primer nombre, i quants n'hi ha.

int main () {
	int n, x;
	cin >> n;
	cout << "nombres que acaben igual que " << n << ":" << endl;
	int sum = 0;
	while (cin >> x) {
		if (x%1000 == n%1000) {
			cout << x << endl;
			++sum;
		}
	}
	cout << "total: " << sum << endl;
	return 0;
}
