#include <iostream>
using namespace std;

//P85288
//pre: natural n entre 1 i 18.
//post: Sequencia de moviments per la n.

void hanoi (int n, char a, char b, char c) {
	if (n == 1) cout << a << " => " << c << endl;
	else {
		hanoi(n - 1, a, c, b);
		hanoi(1, a, b, c);
		hanoi(n - 1, b, a, c);
	}
}

int main () {
	int n;
	char a = 'A', b = 'B', c = 'C';
	cin >> n;
	hanoi(n, a, b, c);
	return 0;
}
