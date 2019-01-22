#include <iostream>
using namespace std;

//P66559
//pre: sequencia d'enters acabada per  un nombre igual o inferior a 0.
//post: per cada natural escriure un triangle bufo i deixar linia en blanc.

void punta (int t) {
	for (int i = 1; i <= t; ++i) {
		cout << "/\\";
		if (i != t) cout << "  "; 
	}
	cout << endl;
} 
void base (int t) {
	for (int i = 0; i < t; ++i) cout << "/__\\";
	cout << endl;
}
void espai (int n) {
	for (int i = 0; i < n; ++i) cout << " ";
}
void escriu_triangle(int t) {
	for (int i = 0; i < t; ++i) {
		espai(2*(t-i)-1);
		punta(i+1);
		espai(2*(t-i)-2);
		base(i+1);
	}
}
int main () {
	int t;
	while (cin >> t and t > 0) {
		escriu_triangle(t);
		cout << endl;
	} 
	return 0;
}
