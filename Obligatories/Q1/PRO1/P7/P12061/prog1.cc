#include <iostream>
using namespace std;

//P12061
//pre: diverses paraules. apareix principi i final.
//post: escriure el nº de paraules entre principi i final (en aquest ordre)
//      sino escriure sequencia incorrecta.


int main () {
	string s;
	int cont = 0;
	bool start = false;
	while (cin >> s and s != "final") {
		if (s == "principi") start = true;
		else if (start) ++cont;
	}
	if (start and s == "final") cout << cont << endl;
	else cout << "sequencia incorrecta" << endl;
	return 0;
}
