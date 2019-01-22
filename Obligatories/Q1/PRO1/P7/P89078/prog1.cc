#include <iostream>
using namespace std;

//P89078
//pre: sequencia de naturals, amb minim, un nombre parell.
//post: escriure la posicio del primer nombre parell.

int main () {
	int n;
	int i = 1;
	while (cin >> n and n%2 != 0) ++i;
	cout << i << endl;
	return 0;
}
