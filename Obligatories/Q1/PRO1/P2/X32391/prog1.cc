#include <iostream>
using namespace std;

//X32391
//pre: 3 naturals d>=0,n>=0,t>0; t assignacions setmanals(a1, a2...an)/ai>=0 
//post: 1 natural que indica quantes de les t setmanes s'ha tingut saldo >0

int main(){
	int d,n,t,a,s=0;
	cin>>d>>n>>t;
	for(int i=1;i<=t;++i){
		cin>>a;
		n=n+a-d;
		if(n>0){
			++s;
		}
	}
	cout<<s<<endl;
	return 0;
}
