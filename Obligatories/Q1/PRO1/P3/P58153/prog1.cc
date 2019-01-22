#include <iostream>
using namespace std;

//P58153
//pre: diversos parells naturals n i m n>=m
//post: per cada parell Hn-Hm (10 decimals)

int main(){
	cout.setf(ios::fixed);
	cout.precision(10);
	int n,m;
	while(cin>>n>>m){
		double Ht=0.0;
		for(int i=m+1; i<=n;++i){
			Ht+= 1.0/double(i);
		}
		cout<<Ht<<endl;
	}
	return 0;
}
