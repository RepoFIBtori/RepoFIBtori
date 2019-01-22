#include <iostream>
using namespace std;

//X01646
//pre: natural b (b>=2), seguit sequencia de naturals
//post: suma (en base 10) dels digits en base b

int main(){
	int b,x,sum=0;
	cin>>b;
	while(cin>>x){
		cout<<x<<": ";
		while(x!=0){
			sum+=x%b;
			x=x/b;	
		}
		cout<<sum<<endl;
		sum=0;
	}
	return 0;
}
