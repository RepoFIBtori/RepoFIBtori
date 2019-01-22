#include <iostream>
using namespace std;

//P42156
//pre: seqüencia de paraules.
//post: retornar les n/2 ultimes paraules, en ordre invers.

void paraules (int& n, int& m) {
	string s;
	while (cin >> s) {
		++n;
		m = n/2;
		paraules(n, m);
		if(n > m) cout << s << endl;
		--n;
	}
}


int main () {
	int n = 0;
	int m;
	paraules(n, m);
	return 0;
}
