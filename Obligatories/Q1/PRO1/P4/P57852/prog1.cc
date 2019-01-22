#include <iostream>
using namespace std;

//P57852
//pre: 4 naturals mes grans que 0
//post: retornar el mcd dels quatre

int mcd4 (int a, int b, int c, int d) {
	for (int i = 0; i < 3; ++i) {
		while (b != 0) {
			int r = a%b;
			a = b;
			b = r;
		}
		if (i == 0) b = c;
		if (i == 1) b = d;
	}
	return a;
}


int main () {
	int a, b, c, d;
	while (cin >> a >> b >> c >> d) {
		cout << mcd4(a, b, c, d) << endl;
	}
	
	return 0;
}
