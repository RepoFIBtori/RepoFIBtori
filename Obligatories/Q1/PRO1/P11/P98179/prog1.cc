#include <iostream>
#include <vector>
using namespace std;

void insereix (vector<double>& v) {
    if (v.size() > 1) {
        double x = v[v.size() - 1];
        for (int i = v.size() - 1; i > 0; --i) {
            if(x < v[i-1]) {
                v[i] = v[i-1];
                v[i-1] = x;
            }
        }
    }
}