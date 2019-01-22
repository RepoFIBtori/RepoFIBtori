#include <iostream>
using namespace std;

//P94801
//pre: tres o mes naturals entre 1 i 10000.
//post: esciure nombre de triplets consecutius que son costats
//      d'un triangle rectangle

int pow (int n) {
	int pot = 1;
	for (int i = 0; i < 2; ++i) {
		pot = pot*n;
	}
	return pot;
}
bool es_triangle_rectangle(int a, int b, int c){
	if (pow(a) == (pow(b) + pow(c))) {
		return true;
	} else if (pow(b) == (pow(a) + pow(c))) {
		return true;
	} else if (pow(c) == (pow(a) + pow(b))) {
		return true;
	} else {
		return false;
	}
}

int main () {
	int a, b, c;
	cin >> a >> b;
	int cont = 0;
	while (cin >> c) {
		if (es_triangle_rectangle(a, b, c)){
			++cont;
		}
		a = b;
		b = c;
	}
	cout << cont << endl;
	return 0;
}
