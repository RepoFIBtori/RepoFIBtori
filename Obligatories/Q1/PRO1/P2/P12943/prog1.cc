#include <iostream>
using namespace std;

//P12943
//pre: 1 natural (n>=1) seguit de n caracters (a, b, c)
//post: escriure caracter majoritari seguit de les vegades que apareix
// cas empat escriure la primera en ordre lexicografic

int main(){
  int n, sA=0,sB=0,sC=0;
  char a;
  cin>>n;
  for(int i=0; i<n; ++i){
    cin >>a;
    if(a=='a') ++sA;
    if(a=='b') ++sB;
    if(a=='c') ++sC;
  }
  if(sA>=sB and sA>=sC){
	  cout<<"majoria de "<<'a'<<endl<<sA<<" repeticio(ns)"<<endl;
  }else if(sB>=sC){
	  cout<<"majoria de "<<'b'<<endl<<sB<<" repeticio(ns)"<<endl;
  }else if(sC>sB){
	  cout<<"majoria de "<<'c'<<endl<<sC<<" repeticio(ns)"<<endl; 
  }
  return 0;
}
