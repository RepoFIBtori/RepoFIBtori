#include <iostream>
#include <string>
using namespace std;

//P54682
//pre: dibuix format per 4 cadesnes de caracters, una per linia.
//post: indica que correspon al dibuix d'entrada.

int main () {
	string s1, s2, s3, s4;
	
	cin >> s1 >> s2 >> s3 >> s4;
	if (s1 == "A____A" and s2 == "||[]||" and s3 == "||__||" and s4 == "~~~~~~") {
		cout << "castell" << endl;
	} else if (s1 == "----" and s2 == "[][]" and s2 == s3 and s3 == s4) {
		cout << "edifici" << endl;
	} else {
		cout << "no res" << endl;
	}
	return 0;
}
