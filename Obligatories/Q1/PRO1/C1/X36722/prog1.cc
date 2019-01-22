#include <iostream>
using namespace std;

//X36722
//pre: 1 real positiu (dollars val 1 euro). Varies linies amb 1 real positiu seguit
//	   de "EUR" o "USD".
//post: Suma de les quantitats en euro i dollars.


int main () {
	cout.setf(ios::fixed);
	cout.precision(4);
	double n;
	cin >> n;
	double x, sum = 0;
	string s;
	while (cin >> x >> s) {
		if (s == "USD") {
			sum += x;
		} else {
			sum += x*n;
		}
	}
	cout << sum/n << " " << sum << endl;
	return 0;
}