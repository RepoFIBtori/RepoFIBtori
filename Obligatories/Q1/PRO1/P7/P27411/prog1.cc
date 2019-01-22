#include <iostream>
using namespace std;

//P27411
//pre: un enter i, seguit de x1,...xn acabada en -1.
//post: si i es correcte escriure el contingut de xi, sino 
//      escriure "Posicio incorrecte.".

int main () {
	int i;
	cin >> i;
	int x;
	int j = 1;
	bool found = false;
	while (cin >> x and x != -1 and (not found)) {
		if (j == i) {
			found = true;
			j = x;
		} 
		else ++j;
	}
	if (found) cout << "A la posicio " << i << " hi ha un " << j << ".";
	else cout << "Posicio incorrecta.";
	cout << endl;
	return 0;
}
