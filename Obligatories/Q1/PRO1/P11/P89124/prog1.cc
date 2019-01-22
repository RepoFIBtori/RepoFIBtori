#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

const int MAX = 1000000;

void garbell (vector<bool>& v) {
    int i = 2;
    while (i <= sqrt(MAX)) {
        for (int j = 2*i; j <= MAX; j += i) v[j] = false;
        if (i == 2) ++i;
        else i += 2;
    }
}
int main () {
    vector<bool> v(MAX + 1, true);
    garbell(v);
    int n;
    while (cin >> n) {
        if (n == 0 or n == 1) cout << n << " no es primer" << endl;
        else {
           if(v[n]) cout << n << " es primer" << endl;
           else cout << n << " no es primer" << endl;
        }
    }
    return 0;
}