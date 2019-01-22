#include <iostream>
using namespace std;
//X50286
//pre:seqüencia strings
//post: nombre de vegades que apareix "hola" (n).

int main(){
  string a;
  int n=0;
  while(cin>>a){
    if(a=="hola"){
      ++n;
    }
  }
  cout<<n<<endl;
  return 0;
}