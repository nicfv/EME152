
#include <complex.h>
#include <numeric.h>
#include <stdio.h>

int main(void) {
    double r[1:4], theta[1:4], theta3_2, r4_2;
    complex double z;
    r[1] = 1.2; // Vertical portion of the ground link
    r[2] = 2.5; // Input link
    r[3] = 6.5; // Floating link (crank shaft)
  //r[4] = ??   // Output link (distance from origin to piston)
    theta[1] = deg2rad(90.0);
    theta[2] = deg2rad(45.0); // Input angle to analyze your mechanism
  //theta[3] = ??
    theta[4] = deg2rad(0.0);
    /**
     * Unknowns:
     * r4 = ?
     * theta3 = ?
     * Loop closure equation:
     * r1 + r2 + r3 = r4
     * r4 - r3 = r1 + r2
     *         = z
     */
    // Calculate Z
    z = polar(r[1], theta[1]) + polar(r[2], theta[2]);
    //             [[[[  knowns  ]]]] [first branch] [second branch]
    complexsolvePR(theta[4], r[3], z, r[4], theta[3], r4_2, theta3_2);
    printf("\nBranch 1:\n");
    printf("theta3 = %lf rad = %lf deg\n", theta[3], rad2deg(theta[3]));
    printf("r4 = %lf m\n", r[4]);
    
    printf("\nBranch 2:\n");
    printf("theta3 = %lf rad = %lf deg\n", theta3_2, rad2deg(theta3_2));
    printf("r4 = %lf m\n", r4_2);
    return 0;
}
