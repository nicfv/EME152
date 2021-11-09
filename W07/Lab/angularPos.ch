/***************************************************************
* This example is for calculating the theta3 and theta4 with
* given theta2.
****************************************************************/
#include <math.h>
#include <fourbar.h>
int main() {
    CFourbar fourbar;
    double r1 = 12, r2 = 4, r3 = 12, r4 = 7, theta1 = 10 * M_PI / 180;
    double rp = 5, beta = 20 * M_PI / 180;
    double theta_1[1:4], theta_2[1:4];
    double complex p1, p2; // two solution of coupler point P
    double theta2 = 70 * M_PI / 180;
    theta_1[1] = theta1;
    theta_1[2] = theta2; // theta2
    theta_2[1] = theta1;
    theta_2[2] = theta2; // theta2
    fourbar.setLinks(r1, r2, r3, r4, theta1);
    fourbar.setCouplerPoint(rp, beta);
    fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK2); // this is how you call fourbar.angularPos() with link 2 as the input
    fourbar.couplerPointPos(theta2, p1, p2); // p1 and p2 are actually outputs of the function
    /**** the first set of solutions ****/
    printf("theta3 = %6.3f, theta4 = %6.3f, P = %6.3f \n", theta_1[3], theta_1[4], p1);
    /**** the second set of solutions ****/
    printf("theta3 = %6.3f, theta4 = %6.3f, P = %6.3f \n", theta_2[3], theta_2[4], p2);
}
