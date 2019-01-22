#include <iostream>
using namespace std;

//P80660
//pre: diversos naturals n>=1
//post: per cada n, escriure nombre de passos fins arribar a 1 (seq. Collatz)

int main(){
  int n;
  while(cin>>n){
    int total=0;
    while(n>1){
      if(n%2==0){
	n=n/2;
      }else{
	n=n*3+1;
      }
      ++total;
    }
    cout <<total<<endl;
  }
  return 0;
}