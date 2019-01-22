#include <iostream>
using namespace std;

//X00639
//pre: 4 enters (n1,d1,n2,d2)representant dos fraccions. on d1 i d2 > 0.
//post: retornar si n1/d1 es menor que n2/d2.

bool c_frac(int n1, int d1, int n2, int d2) {
	return n1*d2 < n2*d1;
}

int main () {
	int n1, d1, n2, d2;
	while (cin >> n1 >> d1 >> n2 >> d2) {
		if (c_frac(n1, d1, n2, d2)) cout << "si" << endl;
		else cout << "no" << endl;
	}
	return 0;
}
