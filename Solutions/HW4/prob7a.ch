/**
 * Solve the complex equation.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <complex.h>

int main(void) {
    /* Knowns */
    double phi1 = M_PI / 2.0, r2 = 2.7;
    /* Known */
    complex double z = polar(sqrt(2.0), deg2rad(35.0));
    /* Unknowns */
    double r1_1, phi2_1, r1_2, phi2_2;
    /* Use complexsolvePR(...) */
    complexsolvePR(phi1, r2, z, r1_1, phi2_1, r1_2, phi2_2);
    /* Print solutions */
    printf("r1 = %7.4lfm, phi2 = %7.4lf rad = %7.4lf deg\n", r1_1, phi2_1, rad2deg(phi2_1));
    printf("r1 = %7.4lfm, phi2 = %7.4lf rad = %7.4lf deg\n", r1_2, phi2_2, rad2deg(phi2_2));
    return 0;
}