#include <iostream>
using namespace std;

//P22654
//pre:n natural (segons)
//post: calcular hores (h), minuts(m) i segons (s). 0<=s<60 0<=m<60

void descompon (int n, int& h, int& m, int& s) {
	h = n/3600;
	m = (n/60)%60;
	s = n%60;
}

int main () {
	int n, h, m, s;
	while (cin >> n) {
		descompon(n, h, m, s);
		cout << h << " " << m << " " << s << endl;
	}
	return 0;
}
