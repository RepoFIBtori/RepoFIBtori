#include <iostream>
#include <cmath>
using namespace  std;

//P36430
//pre: 4 naturals a,b,c,d a<=b i c<=d.
//post: escriure la solucio natural de l'equacio x²+y²=z² on a<=x<=b i 
//      c<=y<=d. esciure la que tingui la x mes petita o la y mes petita. sino
//      escriure "Sense solucio!".

int main () {
	int a, b, c, d;
	cin >> a >> b >> c >> d;
	bool found = false;
	int x, y, z;
	for (x = a; x <= b and not found; ++x) {
		for (y = c; y <= d and not found; ++y) {
			double z1= sqrt(x*x + y*y);
			z = int(z1);
			if (z1 == double(z)) found = true;
		}
	}
	if (found) cout << x-1 << "^2" << " + " << y-1 << "^2 = " << z << "^2" << endl;
	else cout << "Sense solucio!" << endl;
	return 0;
}
