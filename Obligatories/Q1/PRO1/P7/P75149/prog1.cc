#include <iostream>
using namespace std;

//P75149
//pre: sequencia de caracters acabada en '.'
//post: escriure 'si' si apareix 'a' en la sequencia o 'no'.

int main () {
	char c;
	bool found = false;
	while (cin >> c and c != '.' and (not found)) {
		found = (c == 'a');
	}
	if (found) cout << "si" << endl;
	else cout << "no" << endl;
	return 0;
}
