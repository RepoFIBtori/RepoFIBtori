void ordena_insercio (vector<double>& v) {
    for (int i = 1; i < v.size(); ++i) {
        double x = v[i];
        int j = i;
        while (j > 0 and v[j - 1] > x) {
            v[j] = v[j - 1];
            --j;
        }
        v[j] = x;
    }
}