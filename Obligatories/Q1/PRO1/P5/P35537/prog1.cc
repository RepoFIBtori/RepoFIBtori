#include <iostream>
using namespace std;

//P35537
//pre: n natural.
//post: dir si es creixent o no.

bool es_creixent (int n) {
	if (n < 10) return true;
	if (n%10 < (n/10)%10) {
		return false;
	}
	return es_creixent(n/10);
}
int main () {
	int n;
	cin >> n;
	if (es_creixent(n)) cout << "true" << endl;
	else cout << "false" << endl;
	return 0;
}