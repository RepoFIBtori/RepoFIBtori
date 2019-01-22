//P98960
//pre: una lletra
//post: si es minuscula pasarla a majuscula i viceversa
#include <iostream>
#include <cctype>
using namespace std;

int main(){
	char car, car_final;
	cin>>car;
	if(car>=65 and car<=90){
		car_final=tolower(car);
	}else{
		car_final=toupper(car);
	}
	cout<<car_final<<endl;
	return 0;
}
