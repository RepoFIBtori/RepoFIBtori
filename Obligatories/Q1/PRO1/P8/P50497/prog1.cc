#include <iostream>
#include <string>
using namespace std;

//P50497
//pre: un string.
//post: retornar si es palindrom o no.

bool es_palindrom (const string& s) {
	int l = s.length();
	for (int i = 0; i < l; ++i) if (s[i] != s[(l-1)-i]) return false;
	return true;
}
