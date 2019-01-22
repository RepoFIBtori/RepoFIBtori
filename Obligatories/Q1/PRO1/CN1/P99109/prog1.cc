#include <iostream>
using namespace std;

//P99109
//pre: 3 paraules en minus.
//post: una linia amb la mes petita (alfabeticament)

int main () {
    string a, b, c;
    cin >> a >> b >> c;
    if (a <= b and a <= c) {
        cout << a << endl;
    } else if (b <= a and b <= c) {
        cout << b << endl;
    } else if (c <= a and c <= b) {
        cout << c << endl;
    }
}