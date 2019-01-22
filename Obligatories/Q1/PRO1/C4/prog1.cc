#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

void llegeix (vector<int>& v, int n) {
    for (int i = 0; i < n; ++i) cin >> v[i];
}

void escriu (const vector<int>& v, int n) {
    if (n > 0) cout << v[0];
    for (int i = 1; i < n; ++i) cout << " " << v[i]; 
}

bool comp (int a, int b) {
    return a > b;
}

int main () {
    int n;
    while (cin >> n) {
        vector<int> v(n);
        llegeix(v, n);
        sort(v.begin(), v.end(), comp);
        escriu(v, n);
        cout << endl;
    }
    return 0;
}