#include <iostream>
using namespace std;

//P38614
//pre: un natural n
//post:línia si es txatxi o no

int main (){
  int n, sum=0;
  cin >>n;
  cout<<n;
  while(n>0){
    sum+=n%10;
    n/=100;
  }
  if(sum%2==0){
    cout<<" ES TXATXI"<<endl;
  }else{
    cout<<" NO ES TXATXI"<<endl;
  }
  return 0;
}