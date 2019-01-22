#include <iostream>
#include <cmath>
using namespace std;

//P34091
//pre: nombre natural (n).
//post: retornar si es perfecte o no.

bool es_perfecte (int n) {
    int sum = 1;
    for (int i = 2; i < sqrt(n); ++i) {
        if (n%i == 0) sum += i + (n/i);
    }
    if(sum == n and n != 1) return true;
    else return false;
}

int main () {
    int n;
    while (cin >> n) {
        if (es_perfecte(n)) cout << "true" << endl;
        else cout << "false" << endl;
    }
    return 0;
}