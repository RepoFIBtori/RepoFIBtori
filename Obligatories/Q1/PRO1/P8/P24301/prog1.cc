#include <iostream>
#include <vector>
using namespace std;

//P24301
//pre: dos vectors v1 i v2.
//post: retornar la concatenacio dels dos vectors.

vector<int> concatenacio(const vector<int>& v1, const vector<int>& v2) {
	vector<int> resultat(v1.size() + v2.size());
	for (int i = 0; i < v1.size(); ++i) resultat[i] = v1[i];
	for (int j = 0; j < v2.size(); ++j) resultat[v1.size() + j] = v2[j];
	return resultat;
}

