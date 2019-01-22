#include <iostream>
#include <cmath>
using namespace std;

int out(char s, int a, int b, int c) {
	if (s == 'A') return a;
	if (s == 'B') return b;
	if (s == 'C') return c;
	return 0;
}

int main () {
	int a, b, c;
	cin >> a >> b >> c;
	int A = min(a, min (b, c));
	int C = max(a, max(b, c));
	int B = a+b+c-A-C;
	char c1, c2, c3;
	cin >> c1 >> c2 >> c3;
	cout << out(c1, A, B, C) << " " << out(c2, A, B, C) << " " << out(c3, A, B, C) << endl;
	return 0;
}
