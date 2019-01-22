#include <iostream>
using namespace std;
//pre: a i b /b>0
//post: divisio de a/b (d) i residu (r)
int main(){

  int a, b, d, r;
  cin >>a>>b;
  d=a/b;
  r=a%b;
  cout<< d<<" "<<r<<endl;
  return 0;
}
