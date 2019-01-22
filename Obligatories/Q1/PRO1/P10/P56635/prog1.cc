#include <iostream>
using namespace std;

struct Rectangle { 
	int x_esq, x_dre, y_baix, y_dalt; 
};

void llegeix (Rectangle& r) {
	cin >> r.x_esq >> r.x_dre >> r.y_baix >> r.y_dalt;
}

int relacio (const Rectangle& r1, const Rectangle& r2) {
	if (r1.x_esq == r2.x_esq and r1.x_dre == r2.x_dre and r1.y_baix == r2.y_baix and r1.y_dalt == r2.y_dalt) return 4;
	if (r1.x_esq >= r2.x_esq and r1.x_dre <= r2.x_dre and r1.y_baix >= r2.y_baix and r1.y_dalt <= r2.y_dalt) return 1;
	if (r1.x_esq <= r2.x_esq and r1.x_dre >= r2.x_dre and r1.y_baix <= r2.y_baix and r1.y_dalt >= r2.y_dalt) return 2;
	if ((r1.x_esq > r2.x_dre or r1.x_dre < r2.x_esq) or (r1.y_baix > r2.y_dalt or r1.y_dalt < r2.y_baix)) return 0;
	return 3;

}

int main () {
	int n;
	cin >> n;
	for (int i = 0; i < n; ++i) {
		Rectangle r1;
		llegeix(r1);
		Rectangle r2;
		llegeix(r2);
		int rel = relacio(r1, r2);
		if (rel == 1) cout << "el primer rectangle es interior al segon" << endl;
		else if (rel == 2) cout << "el segon rectangle es interior al primer" << endl;
		else if (rel == 3) cout << "els rectangles intersecten" << endl;
		else if (rel == 4) cout << "els rectangles son iguals" << endl;
		else cout << "els rectangles no intersecten" << endl;
	}
	return 0;
}
