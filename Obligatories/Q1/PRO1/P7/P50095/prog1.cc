#include <iostream>
#include <cmath>
using namespace std;

//P50095
//pre: nombres naturals
//post: escriure el seguent primer.

bool primer (int n) {
	if (n <= 1) return false;
	for (int i = 2; i <= sqrt(n); ++i) {
		if (n%i == 0) return false;
	}
	return true;
}
 
int main () {
	int n;
	while (cin >> n and primer(n)) {
		n = n + 1;
		while (not primer(n)) ++n;
		cout << n << endl;
	}
	return 0;
}
