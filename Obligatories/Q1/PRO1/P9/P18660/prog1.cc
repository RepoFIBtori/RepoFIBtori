#include <iostream>
#include <vector>
using namespace std;

//P18660
//pre: diversos jocs proves. Cada joc conte 3 parts. 1) tres naturals
//     x, m. n. 2) sequencia de x paraules. 3) matriu de m files i n
//     columnes. lletres minusculse a,...,z.
//post: reproduir la matriu d'entrada, canviant les lletres de les
//      paraules a majuscules. separar cada lletra de la sopa per espai
//      en blanc, separar cada joc amb linia en blanc.

typedef vector< vector<char> > Matriu;
typedef vector<string> Paraula;

void in_matriu (Matriu& sopa, const int& m, const int& n) {
	for (int i = 0; i < m; ++i) {
		for (int j = 0; j < n; ++j) {
			cin >> sopa[i][j];
		}
	}
}

void out_matriu (Matriu sopa, int m, int n) {
	for (int i = 0; i < m; ++i) {
		for (int j = 0; j < n; ++j) {
			cout << sopa[i][j];
			if (j != n-1) cout << " ";
		}
		cout << endl;
	}
}

char maj(char c) {
	return 'A' + (c-'a');
}

int buscar_h(Matriu& sopa, string s, int k) {
	int i, j;
	i = j = 0;
	while (j <= sopa[0].size() - s.length() and i < s.length()) {
		if (sopa[k][i+j] == s[i]) ++i;
		else {
			i = 0;
			++j;
		}
	}
	if (i == s.length()) return j;
	else return -1;
}
int buscar_v(Matriu& sopa, string s, int k) {
	int i, j;
	i = j = 0;
	while (j <= sopa.size() - s.length() and i < s.length()) {
		if (sopa[i+j][k] == s[i]) ++i;
		else {
			i = 0;
			++j;
		}
	}
	if (i == s.length()) return j;
	else return -1;
}

void maj_matriu (Matriu& sopa, Matriu& sopa2, Paraula p) {
	for (int z = 0; z < p.size(); ++z) {
		string s = p[z];
		for (int i = 0; i < sopa.size(); ++i) {
			int pos = buscar_h(sopa, s, i);
			for (int k = 0; pos != -1 and k < s.length(); ++k) {
				sopa2[i][k+pos] = maj(sopa[i][k+pos]);
			}
		}
		for (int j = 0; j < sopa[0].size(); ++j) {
			int pos = buscar_v(sopa, s, j);
			for (int k = 0; pos != -1 and k < s.length(); ++k) {
				sopa2[k+pos][j] = maj(sopa[k+pos][j]);
			}
		}
	}
}

int main () {
	int x, m, n;
	while (cin >> x >> m >> n) {
		Paraula p(x);
		for (int i = 0; i < x; ++i) {
			cin >> p[i];
		}
		Matriu sopa(m, vector<char>(n));
		Matriu sopa2(m, vector<char>(n));
		in_matriu (sopa, m, n);
		sopa2 = sopa;
		maj_matriu(sopa, sopa2, p);
		out_matriu(sopa2, m, n);
		cout << endl;
	}
	return 0;
}
