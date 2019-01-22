#include <iostream>
#include <string>
using namespace std;

//pre: tres naturals h, m, s
//post: +1 s / hh:mm:ss

int main(){
  int h, m, s;
  string h1,m1,s1;
  cin>> h >> m >>s;
  s=s+1;
  if(s==60){
	  s=0;
	  m++;
  }
  if(m==60){
	  m=0;
	  h++;
  }
  if(h==24){
	  h=0;
  }
  if(s<10){
	  s1="0";
  }
  if(m<10){
	  m1="0";
  }
  if(h<10){
	  h1="0";
  }
  cout << h1<<h <<":"<< m1<<m <<":"<< s1<<s <<endl;
  return 0;
}
