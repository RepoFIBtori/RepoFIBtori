#include <iostream>
using namespace std;

//P55622
//pre: 1 natural (n)
//post: nombre de digits d'n (d)

int main(){
	int n,d=1;
	cin>>n;
	cout<<"El nombre de digits de "<<n<<" es ";
	while(n>9){
		n/=10;
		d++;
	}
	cout<<d<<"."<<endl;
	return 0;
}
