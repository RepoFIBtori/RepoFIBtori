#include <iostream>
using namespace std;

//P19991
//pre: mida tauler (n), segueixen n files amb n caracters ('0'-'9')
//post: nombre total de monedes a les dues diagonals


int main(){
  int n,sum=0;
  char num;
  cin>>n;
  for(int i=0; i<n; ++i){
    for(int j=0; j<n; ++j){
      cin>>num;
      if(i==j or i+j==n-1){
	sum+=num%'0';
      }
    } 
  }
  cout<<sum<<endl;
  return 0;
}