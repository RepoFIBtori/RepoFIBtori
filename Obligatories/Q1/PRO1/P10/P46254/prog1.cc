#include <iostream>
#include <cmath>
using namespace std;

//P46254
//Pre: dos punts, cada punt una struct.
//Post: retorni la distancia entre dos punts.

struct Punt {
    double x,y;
};

double distancia (const Punt& a, const Punt& b) {
    return sqrt(pow(a.x - b.x, 2) + pow(b.y - a.y, 2));
}