#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

//P50036
//pre: un vector i un punt x.
//post: retornar la regla de horner.

int avalua (const vector<int>& p, int x) {
	int total = 0;
	for (int i = 0; i < p.size(); ++i) total = total + p[i]*pow(x, i);
	return total;
}
