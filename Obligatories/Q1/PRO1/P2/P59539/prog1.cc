#include <iostream>
using namespace std;

//P59539
//pre: 1 natural (n)
//post: Hn amb quatre decimals

int main(){
	cout.setf(ios::fixed); 
	cout.precision(4);
	
	int n;
	double Hn=0.0;
	cin>>n;
	for(int i=1; i<=n; i++){
		Hn+= 1.0/double(i);			
	}
	cout<<Hn<<endl;
	return 0;
}


