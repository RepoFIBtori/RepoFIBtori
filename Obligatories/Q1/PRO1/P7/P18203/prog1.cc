#include <iostream>
using namespace  std;

//P18203
//pre: diverses linies, cadascuna 4 naturals a,b,c,d a<=b i c<=d.
//post: escriure la solucio de x³+y³=z³. si hi ha mes d'una linia
//      escriure la primera. si no hi ha solucio escriure "Sense solucio!".

int main () {
	int a, b, c, d;
	bool found = false;
	while(cin >> a >> b >> c >> d){
			if (not found and (a == 0 or c == 0)) {
				found = true;
				cout << a << "^3" << " + " << c << "^3 = " << a+c << "^3" << endl;
			}
	}
	if (not found) cout << "Sense solucio!" << endl;
	return 0;
}
