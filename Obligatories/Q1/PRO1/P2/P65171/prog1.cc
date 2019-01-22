#include <iostream>
using namespace std;

//P65171
//pre: 1 natural (n>=2) i n nombres reals
//post: variança dels n reals amb 2 digits decimals.

int main(){
  cout.setf(ios::fixed); 
  cout.precision(2);
  int n;
  double x, a, b;
  cin >>n;
  for(int i=1; i<=n; ++i){
   cin>>x;
   a+=x*x;
   b+=x;
  }
  cout<<((1.0/(n-1))*a)-((1.0/(n*(n-1)))*b*b)<<endl;
  
  return 0;
}