#include <iostream>
using namespace std;

//P29973
//pre: 1 natural (n)
//post: n linies, que la linia i tingui i asteriscos

int main(){
	int n;
	cin>>n;
	for(int i=0; i<n; ++i){
		for(int y=0; y<=i; ++y){
			cout<<'*';
		}
		cout<<endl;
	}
	return 0;
}
