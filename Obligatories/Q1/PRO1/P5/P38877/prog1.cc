#include <iostream>
using namespace std;

//P38877
//pre: natural n, seguit de n paraules.
//post: esriure les n ultimes paraules en ordre invers.

void paraules (int& n) {
    string s;
    while(cin >> s){
        paraules(n);
        if (n != 0) {
			  cout << s << endl;
			  n--;
		  }
        
	 }
}
int main () {
    int n;
    cin >> n;
    paraules(n);
    return 0;
}
