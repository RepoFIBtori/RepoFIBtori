#include <iostream>
using namespace std;

//P64979
//pre: natural n.
//post: escriure les n primeres linies de la taula de multiplicar de n.


int main () {
	int n;
	cin >> n;
	for (int i = 1; i <= n; ++i) {
		cout << n << " x " << i << " = " << n*i << endl;
	}
	return 0;
}
