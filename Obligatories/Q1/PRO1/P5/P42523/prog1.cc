#include <iostream>
using namespace std;

//P42523
//pre: a, b naturals. Un estrictament positiu.
//post: mcd(a,b);

int mcd (int a, int b) {
	if (b == 0) return a;
	return mcd (b, a%b);
}

int main () {
	int a, b;
	while (cin >> a >> b) {
		cout << mcd(a, b) << endl;
	}
	return 0;
}