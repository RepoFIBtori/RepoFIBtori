//P61634
//pre: 1 natural entre [1800,9999] 
//post: si es traspas "YES" sino "NO"
#include <iostream>
using namespace std;

int main(){
	int a;
	cin>>a;
	if((a%4==0 and (a/100)%4==0) or (a%4==0 and a%100!=0)){
		cout<<"YES"<<endl;
	}else{
		cout<<"NO"<<endl;
	}
	return 0;
}
