#include <iostream>
using namespace std;

//P32533
//pre: natural n >= 1.
//post: figura corresponent.

int main () {
	int n;
	cin >> n;
	for (int i = 0; i < n; ++i) {
		for (int j = 0; j < n; ++j) {
			if ((i + j) == (n - 1)) {
				cout << '/';
			} else if ((i + j) < (n - 1)){
				cout << '+';
			} else {
				cout << '*';
			}
		}
		cout << endl;
	}
	return 0;
}
