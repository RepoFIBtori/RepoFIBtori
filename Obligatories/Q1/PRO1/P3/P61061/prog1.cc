#include <iostream>
using namespace std;

//P61061
//pre: diversos naturals
//post: per cada nombre, escriure el producte dels digits
//fins que el producte tingui 1 digit. escriure 10 guions
//despres de la sortida de cada nombre 


int main(){
	int n;
	while (cin >> n) {
		int m = 1;
		if (n == 0) {
			cout << "El producte dels digits de 0 es 0."  << endl << "----------"<<endl;
		} else {
			while (m > 0) {
				
				cout<< "El producte dels digits de " << n << " es ";
				while (n != 0) {
					m *= n%10;
					n /= 10;
				}
				cout << m << "." << endl;
				if (n > 9) {
					n = m;
					m=1;
				}else{
					m=0;
				}
				
			}
		cout << "----------" << endl;
		}
	}
	return 0;
}
