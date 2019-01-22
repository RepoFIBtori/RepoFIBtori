#include <iostream>
using namespace std;

//P79320
//pre: 4 strings, descripcio dels cabells, els ulls, el nas i la boca.
//post: retrat del lladre.

int main () {
	string c, u, n, b;
	cin >> c >> u >> n >> b;
	if (c == "arrissats"){
		cout << "@@@@@" << endl;
	} else if (c == "llisos") {
		cout << "VVVVV" << endl;
	} else if (c == "pentinats") {
		cout << "XXXXX" << endl;
	}
	if (u == "aclucats"){
		cout << ".-.-." << endl;
	} else if (u == "rodons") {
		cout << ".o-o." << endl;
	} else if (u == "estrellats") {
		cout << ".*-*." << endl;
	}
	if (n == "axafat"){
		cout << "..0.." << endl;
	} else if (n == "arromangat") {
		cout << "..C.." << endl;
	} else if (n == "aguilenc"){
		cout << "..V.." << endl;
	}
	if (b == "normal"){
		cout << ".===." << endl;
	} else if (b == "bigoti") {
		cout << ".~~~." << endl;
	} else if (b == "dents-sortides"){
		cout << ".www." << endl;
	}
	
	
	
	
	return 0;
}
