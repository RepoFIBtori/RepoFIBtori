#include <iostream>
using namespace std;

//P87198
//pre: diversos naturals (n>=2)
//post: per cada n, octagon de mida n amb 'X'. deixar linia buida despres

int main(){
	int n;
	while(cin>>n){
		for(int i=0; i<n-1; ++i){
			for(int y=0; y<(n-1)-i; ++y){
				cout<<" ";
			}
			for(int z=0; z<n+(2*i);++z){
				cout<<'X';
			}
			cout<<endl;
		}
		for(int i=0; i<n; ++i){
			for(int y=0; y<n+(2*(n-1));++y){
				cout<<'X';
			}
			cout<<endl;
		}
		for(int i=0; i<n-1; ++i){
			for(int y=0; y<=i; ++y){
				cout<<" ";
			}
			for(int z=0; z<n+(2*(n-1)-2*(i+1));++z){
				cout<<'X';
			}
			cout<<endl;
		}
		cout<<endl;	
	}
	return 0;
}
