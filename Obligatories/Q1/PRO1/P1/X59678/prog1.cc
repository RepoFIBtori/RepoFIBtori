//X59678
//pre: 3 enters diferents
//post: minim dels 3 enters

#include <iostream>
using namespace std;

int main(){
	int a,b,c;
	cin >>a>>b>>c;
	if(c<b){
		b=c;
	}
	if(b<a){
		a=b;
	}
	cout<<a<<endl;
	return 0;
}




