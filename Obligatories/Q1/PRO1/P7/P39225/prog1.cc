#include <iostream>
using namespace std;

//P39225
//pre: entrada comença amb nombre i seguit de sequencia x1...xn, 
//     acabada en -1. 1<= i<= n.
//post: escriure el contingut de la posicio i.
 
int main () {
	int n;
	cin >> n;
	int x;
	int i = 1;
	while (cin >> x and (x != -1) and i < n) ++i;
	cout << "A la posicio " << i << " hi ha un "<< x << "." << endl;
	return 0;
}
