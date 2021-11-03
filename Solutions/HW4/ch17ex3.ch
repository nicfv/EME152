/**
 * Compute the value of z6.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>
#include <complex.h>

int main(void) {
    double complex z1 = complex(3, 4),
                   z2 = polar(5, deg2rad(40.0)),
                   z3 = complex(4, 4),
                   z4, z5, z6;

    z4 = z1 * z2 - z2 * z3;
    z5 = z1 / z3 - z1 * z3;
    z6 = z4 - z1 * z5 + z2;

    printf("z4 = %.3f\n", z4);
    printf("z5 = %.3f\n", z5);
    printf("z6 = %.3f\n", z6);

    return 0;
}
