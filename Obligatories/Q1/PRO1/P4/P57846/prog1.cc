#include <iostream>
using namespace std;

//P57846
//pre: dos enters a i b
//post: retornar el màxim dels dos.

int max2(int a, int b){
	if (a > b){
		return a;
	}else{
		return b;
	}
}
int main () {
	int a, b;
	cin >> a >> b;
	cout << max2(a, b) << endl;
	return 0;
}
