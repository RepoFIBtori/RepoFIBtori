//P70955
//pre: 5 naturals, anys(a), dies(d), hores(h), minuts(m), segons(s) (1 any=365 dies)
//post: numero total de segons

#include <iostream>
using namespace std;

int main(){
	int a, d, h, m, s, t;
	cin>>a>>d>>h>>m>>s;
	t=s+m*60+h*3600+d*24*3600+a*365*24*3600;
	cout<<t<<endl;
	return 0;
}
