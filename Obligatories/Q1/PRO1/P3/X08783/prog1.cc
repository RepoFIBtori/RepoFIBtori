#include <iostream>
using namespace std;

//X08783
//pre: dos naturals b>=2 i n>=1
//post: nombre de xifres de n en base b

int main(){
	int b,n,x=1;
	while(cin>>b>>n){
		while(n>(b-1)){
			++x;
			n/=b;
		}
		cout<<x<<endl;
		x=1;
	}
	
	return 0;
}
