#include <iostream>
using namespace std;

//P42404
//pre: real x seguit de "dolars" o "euros"
//post: lequivalent de x dolars en euros si l'entrada eren euros
//      o al reves.

int main () {
	cout.setf(ios::fixed);
	cout.precision(2);
	double x;
	string s;
	cin >> x >> s;
	if (s == "euros") {
		cout << x*1.254 << " dolars" << endl;
	}
	if (s == "dolars") {
		cout << x/1.254 << " euros" << endl;
	}
	return 0;
}
