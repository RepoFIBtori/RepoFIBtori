#include <iostream>
#include <vector>
using namespace std;

//P11141
//Pre: estudiants, amb dni, nom, nota i si es repetidor.
//Post: calcular la nota mitjana, la minima i la maxima. 

struct Estudiant {
	int dni;
	string nom;
	double nota;
	bool repetidor;
};

void informacio(const vector<Estudiant>& es, double& min, double& max, double& mitj) {
	int n = es.size();
	min = 10;
	max = 0;
	mitj = 0;
	int cont = 0;
	for (int i = 0; i < n; ++i) {
		if (not es[i].repetidor and es[i].nota != -1) {
			if (es[i].nota < min) min = es[i].nota;
			if (es[i].nota > max) max = es[i].nota;
			mitj += es[i].nota;
			++cont;
		}
	}
	if (cont != 0) mitj = mitj / double(cont);
	else {
		min = -1.0;
		max = -1.0;
		mitj = -1.0;
	}
}

