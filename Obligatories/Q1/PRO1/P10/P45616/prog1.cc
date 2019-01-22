#include <iostream>
using namespace std;

//P45616
//Pre: rellotge (struct hores, minutss, segons)
//Post: mitja_nit() retorna rellotge a mitja nit, incrementa() avança un segon el rellotge. 
//      Escriu() escriu l'hora del rellotge HH:MM:SS.

struct Rellotge {
    int h; //hores (0<=h<24)
    int m; // minuts (0<=m<60)
    int s; // segons (0<=s<60)
};
Rellotge mitja_nit() {
    Rellotge r;
    r.h = 0;
    r.m = 0;
    r.s = 0;
    return r;
}
void incrementa(Rellotge& r) {
    ++r.s;
    if (r.s == 60) {
        r.s = 0;
        ++r.m;
        if (r.m == 60) {
            r.m = 0;
            ++r.h;
            if (r.h >= 24) r.h = 0;
        }
    }
}
void escriu (const Rellotge& r) {
    if (r.h < 10) cout << "0";
    cout << r.h <<":";
    if (r.m < 10) cout << "0";
    cout << r.m << ":";
    if (r.s < 10) cout << "0";
    cout << r.s << endl;
}
