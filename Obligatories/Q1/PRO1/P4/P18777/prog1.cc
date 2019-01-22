#include <iostream>
#include <cmath>
using namespace std;

//P18777
//pre: l'any (a) està entre [1800, 9999].
//post: Dia de la setmana corresponent.

string dia_de_la_setmana(int d, int m, int a) {
	int m1 = m - 2;
	if (m1 <= 0) {
		m1 = m1 + 12;
		a = a - 1;
	}
	int c = a/100;
    int y = a%100;
	int f = (int(2.6*m1 - 0.2)) + d + y + (y/4) + (c/4) - (2*c);
    while (f < 0) {
        f = f + 7;
    }
	f = f%7;
    
	if (f == 0) {
		return "diumenge";
	} else if (f == 1) {
		return "dilluns";
	} else if (f == 2) {
		return "dimarts";
	} else if (f == 3) {
		return "dimecres";
	} else if (f == 4) {
		return "dijous";
	} else if (f == 5) {
		return "divendres";
	} else {
		return "dissabte";
	}
}

int main () {
	int d, m, a;
	while (cin >> d >> m >> a) {
		cout << dia_de_la_setmana(d, m, a) << endl;
	}
	return 0;
}