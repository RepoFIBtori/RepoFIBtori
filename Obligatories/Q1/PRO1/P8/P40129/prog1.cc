#include <iostream>
#include <string>
using namespace std;

//P40129
//pre: l'entrada es una sequencia de codis ISBN, amb un digit
//     desconegut indicat amb '?'.
//post: per cada linia escriure el digit desconegut.

int main () {
	string isbn;
	while (cin >> isbn){
		int pos;
		int sum = 0;
		for (int i = 0; i < 10; ++i) {
			if (isbn[i] == '?') pos = i;
			else if (isbn[i] == 'X') sum = sum + 10*(10 - i);
			else sum = sum + (isbn[i] - '0')*(10 - i);
		}
		for (int j = 0; j <= 10; ++j)
			if ((sum + j*(10-pos))%11 == 0){
				if (j == 10) cout << 'X' << endl;
				else cout << j << endl;
			}
	}
	return 0;
}
