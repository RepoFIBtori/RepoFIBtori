#include <iostream>
using namespace std;

//P87198
//pre:diversos naturals n>=2
//post: escriure octagon mida n amb 'X' per cada n.


int main(){
	int n;
	while(cin>>n){
		for(int i=1; i<=n; ++i){
			for(int j=1; j<(2*n-1)+i; ++j){
				if(i+j>=n+1){
					cout<<'X';
				}else{
					cout<<' ';
				}
			}
			cout<<endl;
		}
		for(int i=1; i<=n/2; ++i){
			for(int j=1; j<=2*n+1; ++j){
				cout<<'X';
			}
			cout<<endl;
		}
		for(int i=0; i<n; ++i){
			for(int j=1; j<=n+2*(n-1)-i; ++j){
				if(j>=i+1){
					cout<<'X';
				}else{
					cout<<' ';
				}
			}
			cout<<endl;
		}
	}
	return 0;
}
