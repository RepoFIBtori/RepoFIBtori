#include <iostream>
using namespace std;

//P50441
//pre: tres linies, cadascuna amb una paraula i un enter nom i edat de la persona.
//post: el nom de la persona mes jove.

int main () {
	string n1, n2, n3;
	int e1, e2, e3;
	cin >> n1 >> e1 >> n2 >> e2 >> n3 >> e3;
	if (e1 < e2 and e1 < e3) cout << n1 << endl;
	if (e2 < e1 and e2 < e3) cout << n2 << endl;
	if (e3 < e1 and e3 < e2) cout << n3 << endl;
	return 0;
}
