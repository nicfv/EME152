/**
 * Find the roots of x^2 - 4x + 4
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>

int main(void) {
    double a, b, c, x1, x2;
    a = 1;
    b = -4;
    c = 4;
    x1 = (-b + sqrt(b * b - 4 * a * c)) / (2 * a);
    x2 = (-b - sqrt(b * b - 4 * a * c)) / (2 * a);
    printf("x1 = %f\n", x1);
    printf("x2 = %f\n", x2);
    return 0;
}
