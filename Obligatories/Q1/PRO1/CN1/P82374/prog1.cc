#include <iostream>
using namespace std;

//P82374
//pre: cinc enters.
//post: si (x pertany a [a,b] i [c,d]) o no altrament.

int main () {
	int x, a, b, c, d;
	cin >> x >> a >> b >> c >> d;
	if  ((x >= a and x <= b) or (x >= c and x <= d)) {
		cout << "si" << endl;
	} else {
		cout << "no" << endl;
 	}
	return 0;
}
