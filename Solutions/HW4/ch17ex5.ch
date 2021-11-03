/**
 * Compute the roots of a quadratic equation.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>
#include <complex.h>

int main(void) {
    /* Define variables */
    double a, b, c, x1, x2;
    double complex cx1, cx2;
    /* Ask for user input */
    printf("a = ");
    scanf("%lf", &a);
    printf("b = ");
    scanf("%lf", &b);
    printf("c = ");
    scanf("%lf", &c);
    /* Part (i) */
    x1 = -b + sqrt(b * b - 4 * a * c) / (2 * a);
    x2 = -b - sqrt(b * b - 4 * a * c) / (2 * a);
    printf("Roots\nx1 = %lf\nx2 = %lf\n", x1, x2);
    /* Part (ii) */
    cx1 = -b + csqrt(b * b - 4 * a * c) / (2 * a);
    cx2 = -b - csqrt(b * b - 4 * a * c) / (2 * a);
    printf("Complex Roots\nx1 = %lf\nx2 = %lf\n", cx1, cx2);
    return 0;
}
