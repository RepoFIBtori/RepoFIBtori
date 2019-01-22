#include <iostream>
#include <cmath>
using namespace std;

//P38045
//pre: sequencia naturals
//post: per cada nombre, donar el quadrat i l'arrel quadrada

int main () {
	int n;
	while (cin >> n) {
		cout.setf(ios::fixed);
		cout.precision(0);
		cout << pow(n, 2) << " ";
		cout.setf(ios::fixed);
		cout.precision(6);
		cout << sqrt(double(n)) << endl;
	}
	return 0;
}
