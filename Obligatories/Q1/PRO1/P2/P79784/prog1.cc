#include <iostream>
using namespace std;

//P79784
//pre: sequencia de caracters 'n','s','e','o'
//post: posicio final de l'objecte inicialment(0,0)

int main(){
	int x=0,y=0;
	char n;
	while(cin>>n){
		if(n=='n') --y;
		if(n=='s') ++y;
		if(n=='o') --x;
		if(n=='e') ++x;
	}
	cout<<"("<<x<<", "<<y<<")"<<endl;
	return 0;
}
