#include <iostream>
using namespace std;

//P93533
//pre:diversos enters.
//post: escriure nombre en base -2.

void base2 (int n) {
	int div = (n/-2);

	if (n%(-2) < 0) {
		if (div < 0) --div;
		else ++div;
	}
	if (div != 0) {
		base2(div);
		cout << n - (-2)*div;
	} else {
		cout << n - (-2)*div;
	}

}
int main () {
	int n;
	while (cin >> n) {
		cout << n << ": ";
		base2(n);
		cout << endl;
	}
	return 0;
}
