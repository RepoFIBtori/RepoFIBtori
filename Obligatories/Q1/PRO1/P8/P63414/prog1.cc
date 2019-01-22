#include <iostream>
#include <vector>
using namespace std;

//P63414
//pre: un natural n, seguit de n naturals entre 1000000000 i 1000001000.
//post: per cada nombre x que aparegui a la sequencia, escriure
//      quantes vegades apareix ordenat creixentment.
const int G = 1000000000;
int main () {
	int n;
	cin >> n;
	int x;
	vector<int> res(1001, 0);
	for (int i = 0; i < n; ++i) {
		cin >> x;
		++ res[x%1001];
	}
	for (int j = 0; j < 1001; ++i)
		if (res[j] != 0) cout << G + j <<" : "<< res[j] << endl; 
	return 0;
}
