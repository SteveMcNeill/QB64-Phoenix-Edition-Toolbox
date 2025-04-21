#include <stdio.h>
#include <math.h>
#include <float.h>

int IsNan(long double n);
int IsInf(long double n);

int IsNan(long double n) { return -isnan(n); }
int IsInf(long double n) { return -isinf(n); }