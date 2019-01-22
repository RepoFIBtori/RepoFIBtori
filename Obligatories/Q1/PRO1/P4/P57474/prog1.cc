#include <iostream>
using namespace std;

//P57474
//pre: natural 0 <= n <= 12
//post: retornar el factorial n!


int factorial (int n) {
	int fact = 1;
	for (int i = 1; i <= n; ++i) {
		fact *= i;
	}
	return fact;
}

int main () {
	int n;
	while (cin >> n) {	
		cout << factorial(n) << endl;
	}
	return 0;
}
