#include <iostream>
using namespace std;

//pre: dos intervals 4 enters [a1,b1] [a2,b2]
//post: [] si no te interval/ [x,y] si en té.

int main(){
  int a1,b1,a2,b2, x, y;
  
  cin >>a1>>b1>>a2>>b2;
  
  if(b1<a2 or b2<a1){
    cout<<"[]"<<endl;
  }
  else{
    if(a1>=a2){
      x=a1;
    }
    else{
      x=a2;
    }
    if(b1>=b2){
      y=b2;
    }
    else{
      y=b1;
    }
    cout<<"["<<x<<","<<y<<"]"<<endl;
  }
  
  
  return 0;
}