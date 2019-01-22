#include <iostream>
#include <vector>
using namespace std;

vector<double> interseccio (const vector<double>& v1, const vector<double>& v2) {
    vector<double> v3;
    int n = v1.size();
    int m = v2.size();
    int j = 0;
    double x = -10000;
    for (int i = 0; i < n; ++i) {
        while(j < m and v1[i] >= v2[j]) {
            if (v1[i] == v2[j] and v1[i] != x) {
                v3.push_back(v1[i]);
                x = v1[i];
            } 
            ++j;
        }
    }
    return v3;
}