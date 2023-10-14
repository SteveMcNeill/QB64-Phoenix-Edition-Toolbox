#include <stdio.h>
#include <math.h>
#include <float.h>

int IsNan(long double n);
int IsInf(long double n);

IsNan(long double n) { return -isnan(n); }
IsInf(long double n) { return -isinf(n); }