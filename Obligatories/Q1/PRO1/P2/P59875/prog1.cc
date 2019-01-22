//P59875
//pre: 2 enters x,y
//post: enters entre x i y de gran a petit
#include <iostream>
using namespace std;

int main(){
	int x,y,z;
	cin>>x>>y;
	if(x<y){
		z=x;
		x=y;
		y=z;
	}
	for(int i=x;i>=y;i--){
		cout<<i<<endl;
	}
	return 0;
}
