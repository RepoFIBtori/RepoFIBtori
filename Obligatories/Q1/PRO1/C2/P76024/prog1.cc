#include <iostream>
using namespace std;

//P76024
//pre: entrada son diversos triplets de naturals, a, b i k.
//     1<=a<=b i k>= 1.
//post: escriure una linia amb el resultat 1/a+1/(a+k)+1/(a+2k)+...
//      amb 4 xifres.

double frac (int a, int b, int k) {
	if (a+k > b) return 1.0/(a);
	return 1.0/(a) + frac(a+k, b, k);
}

int main () {
	cout.setf(ios::fixed);
	cout.precision(4);
	int a, b, k;
	while (cin >> a >> b >> k) {
		cout << frac(a, b, k) << endl;
	}
	return 0;
}
