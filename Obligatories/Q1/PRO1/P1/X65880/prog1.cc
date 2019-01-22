//X65880
//pre: caracter alfabetic
//post: tipus de caracter

#include <iostream>
using namespace std;

int main(){
	char car;
	cin>>car;
	if(car>=48 and car<=57){
		cout<<"Numero"<<endl;
	}
	if(car>=97 and car<=122){
		cout<<"Lletra minuscula"<<endl;
	}
	if(car>=65 and car<=90){
		cout<<"Lletra majuscula"<<endl;
	}
	return 0;
}
