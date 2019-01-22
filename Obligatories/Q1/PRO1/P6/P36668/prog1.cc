#include <iostream>
using namespace std;

//P36668
//pre: un natural n.
//post: escriure la suma de quadrats.

int sum_q(int n) {
	if (n == 0) return 0;
	return sum_q(n-1) + n*n;
}
int main () {
	int n;
	cin >> n;
	cout << sum_q(n) << endl;
	return 0;
}
