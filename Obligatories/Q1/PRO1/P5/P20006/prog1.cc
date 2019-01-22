#include <iostream>
using namespace std;


//P20006
//pre: caracter, enters.
//post: escriure linia amb resultat de l'expressio

int operacions (char c) {
	while (cin >> c) {
		if (c >= '0' and c <= '9') return c - '0';
		if (c == '-') return operacions(c) - operacions(c);
		if (c == '+') return operacions(c) + operacions(c);
		if (c == '*') return operacions(c)*operacions(c);
	}
	return 0;
}

int main () {
	char c;
	cout << operacions(c) << endl;
	return 0;
}
