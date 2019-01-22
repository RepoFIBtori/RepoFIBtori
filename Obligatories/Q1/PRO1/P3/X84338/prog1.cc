#include <iostream>
using namespace std;

//X84338
//pre: 1 natural n (0<=n<2^31)
//post: si es parell,suma de la primera i segona meitat de n i relacio

int main(){
	int n,n1;
	cin>>n;
	n1=n;
	int even=0;
	while(n1!=0){
		n1/=10;
		++even;
	}
	if(even%2==0 and even!=0){
		int sum1=0,sum2=0;
		for(int i=0; i<even; ++i){
			if(i<(even/2)){
				sum2+=n%10;
			}else{
				sum1+=n%10;
			}
			n/=10;
		}
		
		cout<<sum1;
		if(sum1>sum2){ 
			cout<<" > ";
		}else if(sum2>sum1){ 
			cout<<" < ";
		}else{
			cout<<" = ";
		}
		cout<<sum2<<endl;
		
	}else{
		cout<<"res"<<endl;
	}
	return 0;
}
