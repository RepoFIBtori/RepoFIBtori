#include <iostream>
using namespace std;

//P13903
//pre: natural n >= 1.
//post: tauler n x n. 

int main () {
	int n;
	cin >> n;
	for (int i = 0; i < n; ++i) {
		for (int j = 0; j < n; ++j) {
			if ((i+j)%2 == 0) {
				cout << '.';
			} else {
				cout << '*';
			}
		}
		cout << endl;
	}
	return 0;
}
