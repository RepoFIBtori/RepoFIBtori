#include <iostream>
using namespace std;

//P67723
//pre: 2 naturals a i b
//post: maxim comu divisor de a i b

int main(){
  int a,b;
  cin >>a>>b;
  cout<<"El mcd de "<<a<<" i "<<b<< " es ";
  //algorisme euclides
  while(b!=0){
    int r=a%b;
    a=b;
    b=r; 
  }
  cout<<a<<"."<<endl;
  return 0;
}
