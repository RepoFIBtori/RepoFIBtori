#include <iostream>
#include <cmath>
using namespace std;

//X11093
//pre: sequencia enters positius sense 0 a l'esquerra
//post: per cada n el programa escriu n cops el digit + 1, utilitzant write_expanded
//      seguit d'un salt de linia.

// Pre: 0<=d<=9 and 0<=x.
void write_digit(int d,int x) {
	for(int i = 0; i <=x; ++i){
		cout << d;
	}
}

// Pre: 0<n.
void write_expanded(int n) {
	int digits = 0, actual, n1 = n;
	while (n1 != 0) {
		++digits;
		n1 /= 10;
	}
	for (int i = 1; i <= digits; ++i) {
		actual = n/pow(10,digits-i);
		write_digit(actual, actual);
		n = n% int(pow(10,digits-i));
	}
}

int main() {
    int n;
    while (cin >> n) {
        write_expanded(n);
        cout << endl;
    }
}