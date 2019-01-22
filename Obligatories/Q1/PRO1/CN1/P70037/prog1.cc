#include <iostream>
using namespace std;

//P70037
//pre:dos naturals a i b.
//post: si b = 0, escriure "@divisio per zero@". Sino, escriure divisio real,
//      divisio entera i residu de a/b.

int main () {
	cout.setf(ios::fixed); 
	cout.precision(3);
	double a, b;
	cin >> a >> b;
	if (b != 0) {
		cout << a/b << " " << int(a)/int(b) << " " << int(a)%int(b) << endl;
	} else {
		cout << "divisio per zero" << endl;
	}
	return 0;
}
