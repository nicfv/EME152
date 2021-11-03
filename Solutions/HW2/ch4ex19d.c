/**
 * Calculate the value of g4(x) when x=3.5
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>

int main(void) {
    double x = 3.5;
    double result;
    result = (3 * x * x + 4 * x + 3) / (5 * sin(x * x) + 4 * x * x + 3);
    printf("g4(%lf) = %lf\n", x, result);
    return 0;
}
