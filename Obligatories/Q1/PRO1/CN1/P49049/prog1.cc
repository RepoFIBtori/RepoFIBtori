#include <iostream>
using namespace std;

//P849049
//pre: real x seguit de "milles" o "quilometres"
//post: equivalent de x milles en quilometres si l'entrada era milles
// i al reves.

int main () {
	cout.setf(ios::fixed); 
	cout.precision(2);
	double x;
	string s;
	cin >> x >> s;
	
	if (s == "milles") {
		cout << x*1.6093 <<" quilometres" << endl;
	}
	if (s == "quilometres") {
		cout << x/1.6093 << " milles" << endl;
	}
	return 0;
}
