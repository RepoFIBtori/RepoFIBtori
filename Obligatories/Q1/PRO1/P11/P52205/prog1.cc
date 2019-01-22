#include <iostream>
#include <vector>
using namespace std;

void merge (vector<double>& v, int e, int m, int d) {
    int n = d - e + 1;
    vector<double> aux(n);
    int i = e;
    int j = m + 1;
    int k = 0;
    while (i <= m and j <= d) {
        if (v[i] <= v[j]) {
            aux[k] = v[i];
            ++i;
        } else {
            aux[k] = v[j];
            ++j;
        }
        ++k;
    }
    while (i <= m) {
        aux[k] = v[i];
        ++k;
        ++i;
    }
    while (j <= d) {
        aux[k] = v[j];
        ++k;
        ++j;
    }
    for (k = 0; k < n; ++k) v[e+k] = aux[k];
}
void merge_sort (vector<double>& v, int e, int d) {
    if (e < d) {
        int m = (e+d)/2;
        merge_sort(v, e, m);
        merge_sort(v, m + 1, d);
        merge(v, e, m, d);
    }
}

void ordena_per_fusio (vector<double>& v) {
    merge_sort(v, 0, v.size()-1);
}
