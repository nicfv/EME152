/**
 * Solve the complex equation.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <complex.h>

int main(void)
{
    /* Knowns */
    double r1 = 1.0, r2 = sqrt(3.0);
    /* Known */
    complex double z = polar(2.7, deg2rad(45.0));
    /* Unknowns */
    double phi1_1, phi2_1, phi1_2, phi2_2;
    /* Use complexsolveRR(...) */
    complexsolveRR(r1, r2, z, phi1_1, phi2_1, phi1_2, phi2_2);
    /* Print solutions */
    printf("phi1 = %7.4lf rad = %7.4lf deg, phi2 = %7.4lf rad = %7.4lf deg\n", phi1_1, rad2deg(phi1_1), phi2_1, rad2deg(phi2_1));
    printf("phi1 = %7.4lf rad = %7.4lf deg, phi2 = %7.4lf rad = %7.4lf deg\n", phi1_2, rad2deg(phi1_2), phi2_2, rad2deg(phi2_2));
    return 0;
}