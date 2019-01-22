#include <iostream>
#include <vector>
using namespace std;

typedef vector <int> Fila;
typedef vector <Fila> Quadrat;

bool es_llati (const Quadrat& q) {
	int n = q.size();
	for (int i = 0; i < n; ++i) {
		int fila = 0;
		int col = 0;
		for (int j = 0; j < n; ++j) {
			fila += q[i][j];
			col += q[j][i];
		}
		if (fila != col) return false;
	}
	return true;
}

int main () {
    int n;
    while (cin >> n) {
        Quadrat q(n, Fila(n));
        for (int i = 0; i < n; ++i)
            for (int j = 0; j < n; ++j) cin >> q[i][j];
        cout << es_llati(q) << endl;
    }
}
