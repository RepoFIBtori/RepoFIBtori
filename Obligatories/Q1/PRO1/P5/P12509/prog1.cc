#include <iostream>
using namespace std;

//P12509
//pre: un natural n, 0<=n<=12.
//post: retornar n!

int factorial (int n) {
	if (n <= 1) return 1;
	return n*factorial(n - 1);
}

int main () {
	int n;
	while (cin >> n) {
		cout << factorial(n) << endl;
	}
	return 0;
}