#include <iostream>
#include <vector>
using namespace std;

//P29094
//Pre: 0 <= m < mida_v
//Post: retornar la posicio de l'element maxim v[0..m], en cas empat
//      retornar la poscio mes petita.

int posicio_maxim (const vector<double>& v, int m) {
	int pos = 0;
	double max = v[0];
	for (int i = 1; i <= m; ++i) {
		if (v[i] > max) {
			max = v[i];
			pos = i;
		}
	}
	return pos;
}