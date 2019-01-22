//P85370
//pre: 2 reals positius (c,i), enter positiu (t), paraula simple o compost.
//post: capital final amb 4 decimals
#include <iostream>
#include <math.h>
using namespace std;

int main(){
	cout.setf(ios::fixed); 
	cout.precision(4);
	
	double c,i, total;
	int t;
	string interes;
	
	cin>>c>>i>>t>>interes;
	if(interes=="simple"){
		total=c*(1+ (i/100)*t);
	}else{
		total=c*pow((1+(i/100)),t);
	}
	cout<<total<<endl;
	return 0;
}
