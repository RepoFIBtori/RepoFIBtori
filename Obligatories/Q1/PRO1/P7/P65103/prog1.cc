#include <iostream>
using namespace std;

//P65103
//pre: un enter i, seguit de x1,...,xn.
//post: si la posicio i es correctaescriure el contingut de i.
//      sino escriure "Posicio incorrecta.".

int main () {
	int i;
	cin >> i;
	int j = 1;
	int x;
	while (j <=i and cin >> x) ++j;
	if (j == i + 1 and i != 0) cout << "A la posicio " << i << " hi ha un " << x << "."; 
	else cout << "Posicio incorrecta.";
	cout << endl;
	return 0;
}
