#include <iostream>
using namespace std;

//P34451
//pre: llegir 1 natural (x) i sequencia enters.
//post: escriure numero d'elements de la sequencia multiples de x.

int main(){
  int x,a,m=0;
  cin>>x;
  while(cin>>a){
    if(a%x==0) ++m;
  }
  cout<<m<<endl;
  return 0;
}