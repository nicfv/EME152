/**
 * Calculate the unknown angles of a fourbar
 * linkage without using any variation of
 * complexsolve().
 * Author: Nicolas Ventura
 */

/* Include the fourbar header file */
#include <fourbar.h>

int main(void) {
    /* Declare variables */
    CFourbar fourbar;
    double r1 = 1.5, r2 = 0.5, r3 = 1.5, r4 = 1.0,
            theta1 = deg2rad(5.0),
            rp = 0.5, beta = deg2rad(20.0),
            theta2 = deg2rad(45.0),
            theta_1[1:4], theta_2[1:4];
    /* There are two complex solutions of coupler point P */
    double complex p1, p2;
    /* Input theta1 (known) and theta2 (given) into the first set of solutions */
    theta_1[1] = theta1;
    theta_1[2] = theta2;
    /* Input theta1 (known) and theta2 (given) into the second set of solutions */
    theta_2[1] = theta1;
    theta_2[2] = theta2;
    /* Do some setup for the fourbar */
    fourbar.uscUnit(false);
    fourbar.setLinks(r1, r2, r3, r4, theta1);
    fourbar.setCouplerPoint(rp, beta);
    /* Calculate the missing angles (set link 2 as the input link) */
    fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK2);
    /* Calculate the coupler point position for the 2 branches */
    fourbar.couplerPointPos(theta2, p1, p2);
    /* Display the positions (2 branches) */
    fourbar.displayPosition(theta2, theta_1[3], theta_1[4]);
    fourbar.displayPosition(theta2, theta_2[3], theta_2[4]);
    /* Print the first set of solutions */
    printf("theta3 = %6.3f deg, theta4 = %6.3f deg, P = %6.3f cm\n",
           rad2deg(theta_1[3]), rad2deg(theta_1[4]), p1*100);
    /* Print the second set of solutions */
    printf("theta3 = %6.3f deg, theta4 = %6.3f deg, P = %6.3f cm\n",
           rad2deg(theta_2[3]), rad2deg(theta_2[4]), p2*100);

    return 0;
}
