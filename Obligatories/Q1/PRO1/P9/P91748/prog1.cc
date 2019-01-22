#include <iostream>
#include <vector>
using namespace std;

typedef vector <int> Fila;
typedef vector <Fila> Quadrat;

bool es_llati(const Quadrat& q) {
	int n = q.size();
	for (int i = 0; i < n; ++i){
		Fila f(n+1, 0);
		Fila c(n+1, 0);
		int sumFila = 0;
		int sumCol = 0;
		for (int j = 0; j < n; ++j) {
			if (q[i][j] <= n && q[i][j] >= 1 && f[q[i][j]] == 0) {
				++f[q[i][j]];
				++sumFila;
			}
			if (q[j][i] <= n && q[j][i] >= 1 && c[q[j][i]] == 0) {
				++c[q[j][i]];
				++sumCol;
			}
		}
		if (sumFila != n or sumCol != n) return false;
	}
	return true;
}

int main () {
    int n;
    while (cin >> n) {
        Quadrat q(n, Fila(n));
        for (int i = 0; i < n; ++i)
            for (int j = 0; j < n; ++j) cin >> q[i][j];
        cout << "FI!" << es_llati(q) << endl;
    }
}