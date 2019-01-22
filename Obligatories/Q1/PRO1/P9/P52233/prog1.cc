#include <iostream>
#include <vector>
#include <string>
using namespace std;

//P52233
//pre: matriu m, caracter c, enter k.
//post: retornar nombre de paraules de la matriu que tenen 
//      el caracter c a la posicio k.

typedef vector<string> Fila;
typedef vector<Fila> Matriu;

int nombre_de_paraules (const Matriu& m, char c, int k) {
	int nrows = m.size();
	int cont = 0;
	for (int i = 0; i < nrows; ++i) {
		for (int j = i; j < m[i].size(); ++j) {
			string p = m[i][j];
			if (k > p.length() - 1);
			else if (p[k] == c) ++cont;
		}
	}
	return cont;
}

int main () {
	return 0;
}
