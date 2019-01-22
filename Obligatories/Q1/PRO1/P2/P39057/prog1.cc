#include <iostream>
#include <cmath>
using namespace std;

//P39057
//pre: int n, n descripcions. Si es rectangle hi ha string "rectangle" seguit 2 reals.
// si es cercle hi ha string "cercle" seguit 1 real.
//post: escriure l'area (6 decimals) per cada descripcio.

int main(){
  cout.setf(ios::fixed); 
  cout.precision(6);
  int n;
  cin>>n;
  for(int i=0;i<n;++i){
      string s;
      cin>>s;
      double a,b;
      if(s=="rectangle"){
          cin>>a>>b;
          cout<<a*b<<endl;
      }
      if(s=="cercle"){
          cin>>a;
          cout<<M_PI*a*a<<endl;
      }
  }
  
  return 0;
}