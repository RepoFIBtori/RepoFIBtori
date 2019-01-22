#include <iostream>
using namespace std;

//P87323
//pre: 2 naturals f i c
//post: escriure f files amb c caracters.

int main(){
	int f,c;
	cin>>f>>c;
	for(int i=0;i<f; ++i){
		for(int j=0; j<c; ++j){
			if(i>j){
				cout<<(i-j)%10;
			}else{
				cout<<(j-i)%10;
			}
		}
		cout<<endl;
	}
	return 0;
}
