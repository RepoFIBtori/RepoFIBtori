#include <iostream>
using namespace std;

//P79860
//pre: n natural.
//post: escriure 2^n - 1 files.

void barres (int n) {
	if (n == 1) {
		cout << '*' << endl;
	} else {
		for (int i = 1; i <= n; ++i) {
			cout << "*";
		}
		cout << endl;
		barres (n-1);
		barres (n-1);
	}
}
int main () {
	int n;
	cin >> n;
	barres (n);
	return 0;
}