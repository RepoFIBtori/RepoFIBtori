#include <iostream>
#include <cmath>
using namespace std;

//P37760
//pre: sequencia de nombres reals
//post: per cada nombre, escriure el sinus i cosinus (6 decimals)

int main () {
    cout.setf(ios::fixed);
    cout.precision(6);
    double n;
    while (cin >> n) {
        cout << sin(n*M_PI/180) << " " << cos(n*M_PI/180) << endl;
    }
    return 0;
}