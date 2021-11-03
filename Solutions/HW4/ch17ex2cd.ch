/**
 * Compute the real, imaginary, magnitude, and
 * phase angle of various complex numbers.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <complex.h>
#include <math.h>

int main(void) {
    double complex z3, z4;
    z3 = complex(7, 15) / complex(9, 30);
    z4 = polar(3, 2.3 * M_PI) + polar(4, 3.4 * M_PI);
    /* Print results of z3 and z4 */
    printf("z3 = %f\n", z3);
    printf("z4 = %f\n\n", z4);
    /* Part (c) */
    printf("real(z3) = %.3f\n", real(z3));
    printf("imag(z3) = %.3f\n", imag(z3));
    printf("abs(z3) = %.3f\n", abs(z3));
    printf("carg(z3) = %.3f\n\n", carg(z3));
    /* Part (d) */
    printf("real(z4) = %.3f\n", real(z4));
    printf("imag(z4) = %.3f\n", imag(z4));
    printf("abs(z4) = %.3f\n", abs(z4));
    printf("carg(z4) = %.3f\n\n", carg(z4));
    return 0;
}
