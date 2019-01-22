#include <iostream>
using namespace std;

//X97024
//pre: un enter tal que 0 < x < 10^9
//post: retornar el nombre de zeros finals que hi ha en el factorial.

int nzeros_fact(int x) {
	if (x == 0) return 0;
	return x/5 + nzeros_fact(x/5);
}
int main () {
	int n;
	while (cin >> n) {
		cout << nzeros_fact(n) << endl;
	}
	return 0;
}
