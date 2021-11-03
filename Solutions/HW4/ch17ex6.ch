/**
 * Compute a complex function and
 * its inverse.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>
#include <complex.h>

complex double f(complex double z) {
    return z * z - 3.0;
}

complex double g(complex double z) {
    return csqrt(z + 3.0);
}

int main(void) {
    complex double fz, gz, z;
    /* Calculate the function f(z) */
    z = I * sqrt(2.0);
    fz = f(z);
    printf("f(z) = %lf\n", fz);
    /* Calculate the function g(z) */
    z = -5.0;
    gz = g(z);
    printf("g(z) = %lf\n", gz);
    return 0;
}