#include <iostream>
#include <cmath>
using namespace std;

//X98097
//pre: natural 0<n<2^31
//post: dues linies, una amb la suma de les xifres senars i parelles d'n,
//      la segona escriure la relacio entre les sumes si son multiples.

int main() {
	int n;
	cin >> n;
	int sum_s, sum_p;
	sum_s = sum_p = 0;
	int i = 0;
	while (n != 0) {
		if (i%2 == 0) {
			sum_s += n%10;
		} else {
			sum_p += n%10;
		}
		n /= 10;
		++i;
	}
	cout << sum_s << " " << sum_p << endl;
	if (sum_s == 0 or sum_p == 0) {
		cout << "0 = 0 * " << max(sum_s, sum_p) << endl;
	} else if (sum_s%sum_p == 0) {
		cout << sum_s << " = " << sum_s/sum_p << " * "<< sum_p << endl;
	} else if (sum_p%sum_s == 0) {
		cout << sum_p << " = " << sum_p/sum_s << " * "<< sum_s << endl;
	} else {
		cout << "res" << endl;
	}
	return 0;
}
