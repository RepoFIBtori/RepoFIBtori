#include <iostream>
using namespace std;

//P35957
//pre: un natural n >= 1, seguit de 2n naturals: a1,b1,...,an,bn.
//     a1 es el primer nombre de l'Anna, b1 es el d'en Bernat,etc.
//post: cal escriure 'A' si guanya Anna,'B' si guanya Bernat o '=' empat.

int digits (int n) {
	int digits = 1;
	while (n > 9) {
		n = n/10;
		++digits;
	}
	return digits;
}
int num (int n, int d) {
	for (int i = 0; i < d/2; ++i) n = n/10;
	return n%10;
}
int main () {
	int n;
	cin >> n;
	int a,b;
	char guanya = '=';
	int da, db;
	for (int i = 0; i < n; ++i) {
		cin >> a;
		da = digits(a);
		if(da%2 == 0 and guanya != 'A') guanya = 'B';
		if (i > 0 and num(a, da) != num(b, db) and guanya != 'A') guanya = 'B';
		cin >> b;
		db = digits(b);
		if ((db%2 == 0 or num(b, db) != num(a, da)) and guanya != 'B') guanya = 'A';
	}
	cout << guanya << endl;
	return 0;
}
