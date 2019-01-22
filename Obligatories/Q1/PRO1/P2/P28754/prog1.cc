//P28754
//pre: 1 natural (n)
//post: representacio en binari d'n a l'inreves.
#include <iostream>
using namespace std;

int main(){
	int n;
	cin>>n;
	while(n>1){
		cout<<n%2;
		n=n/2;
	}
	cout<<n<<endl;
	return 0;
}
