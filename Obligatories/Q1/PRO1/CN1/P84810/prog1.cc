#include <iostream>
using namespace std;

//P84810
//pre: sequencia dos o mes naturals entre 2 i 10000.
//post: nombre de parelles de nombres primers consecutius.

bool es_primer (int n){
	bool primer = true;
	for (int i = 2; i <= n/2; ++i) {
		if (n%i == 0) {
			primer = false;
		}
	}
	return primer;
}

int main () {
	int n1, n2;
	cin >> n1;
	int cont = 0;
	while (cin >> n2) {
		if (es_primer(n1) and es_primer(n2)) {
			++cont; 
		}
		n1 = n2;
	}
	cout << "parells de nombres primers consecutius: " << cont << endl;
	return 0;
}
