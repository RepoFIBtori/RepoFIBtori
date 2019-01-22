#include <iostream>
using namespace std;

//P92351
//pre: a enter i b natural (b>o)
//post: divisio entera (d) i residu (r) de a/b.

int main(){
	int a,b,d,r;
	cin >> a >> b;
	d=a/b;
	r=a%b;
	if(r<0){
		r=r+b;
		if(d<0){
			d=d-1;
		}else{
			d=d+1;
		}
	}
	cout << d << " " << r << endl;
	return 0;
}
