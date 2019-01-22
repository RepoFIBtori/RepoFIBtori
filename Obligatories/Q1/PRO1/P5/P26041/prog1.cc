#include <iostream>
using namespace std;

//P26041
//pre: sequencia paraules.
//post: escriure paraules en ordre invers.

void paraules() {
	string s;
	while (cin >> s) {
		paraules();
		cout << s << endl;
	}
}

int main () {
	paraules();
	return 0;
}
