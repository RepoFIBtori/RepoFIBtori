#include <iostream>
using namespace std;

bool es_potencia_de_3(int n) {
	if (n == 0) return false;
	if (n == 1) return true;
	return n%3 == 0 and es_potencia_de_3(n/3);
}
