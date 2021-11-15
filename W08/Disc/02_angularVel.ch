/**
 * File: angularVel.ch
 * Calculate the angular
 * velocity for both solutions
 * of the mechanism using
 * the CFourbar class.
 */
#include <math.h>
#include <fourbar.h>

int main(void)
{
    CFourbar fourbar;
    double r1 = 0.06,
           r2 = 0.02,
           r3 = 0.04,
           r4 = 0.055,
           theta1 = 10 * M_PI / 180;
    double rp = 0.035,
           beta = 20 * M_PI / 180;
    double theta2 = 35 * M_PI / 180;
    double omega2 = -20;

    double theta_1 [1:4], theta_2 [1:4];
    double omega_1 [1:4], omega_2 [1:4];

    theta_1[1] = theta1;
    theta_1[2] = theta2;
    theta_2[1] = theta1;
    theta_2[2] = theta2;

    omega_1[2] = omega2;
    omega_2[2] = omega2;

    fourbar.uscUnit(false);
    fourbar.setLinks(r1, r2, r3, r4, theta1);
    fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK2);
    fourbar.angularVel(theta_1, omega_1, FOURBAR_LINK2);
    fourbar.angularVel(theta_2, omega_2, FOURBAR_LINK2);

    printf("First solution set:\n");
    printf("omega3 = %6.3f  (rad/s)\n"
           "omega4 = %6.3f  (rad/s)\n",
           omega_1[3], omega_1[4]);

    printf("Second solution set:\n");
    printf("omega3 = %6.3f  (rad/s)\n"
           "omega4 = %6.3f  (rad/s)\n",
           omega_2[3], omega_2[4]);

    return 0;
}
