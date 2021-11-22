/***************************************************************
* File: 01_forceTorque.ch
* This example calcuates the joint force and output torque at
* a given point.
***************************************************************/
#include <fourbar.h>
int main(void) {
    CFourbar fourbar;
    double r1 = 12 / 12.0, r2 = 4 / 12.0, r3 = 12 / 12.0, r4 = 7 / 12.0, theta1 = 0;
    double rp = 5 / 12.0, beta = 20 * M_PI / 180;
    double theta_1[1:4], theta_2[1:4], omega[1:4], alpha[1:4];
    array double X[9];
    double g = 32.2;
    double rg2 = 2 / 12.0, rg3 = 6 / 12.0, rg4 = 3.5 / 12.0;
    double delta2 = 0.0, delta3 = 0, delta4 = 0.0;
    double m2 = 0.8 / g, m3 = 2.4 / g, m4 = 1.4 / g;
    double ig2 = 0.012 / 12, ig3 = 0.119 / 12, ig4 = 0.038 / 12, tl = 0;
    /* initialization of link parameters and
    inertia properties */
    theta_1[1] = 0;
    theta_1[2] = 150 * M_PI / 180;
    theta_2[1] = 0;
    theta_2[2] = 150 * M_PI / 180;
    omega[2] = 5;
    alpha[2] = -5;
    fourbar.uscUnit(true);
    fourbar.setLinks(r1, r2, r3, r4, theta1);
    fourbar.setCouplerPoint(rp, beta);
    fourbar.setGravityCenter(rg2, rg3, rg4, delta2, delta3, delta4);
    fourbar.setInertia(ig2, ig3, ig4);
    fourbar.setMass(m2, m3, m4);
    // find theta3, theta4
    fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK2);
    // find omega3, omega4
    fourbar.angularVel(theta_1, omega, FOURBAR_LINK2);
    // find alpha3, alpha4
    fourbar.angularAccel(theta_1, omega, alpha, FOURBAR_LINK2);
    // find forces, torque
    fourbar.forceTorque(theta_1, omega, alpha, tl, X);
    printf("first solution X = %.4f \n", X);
    // find omega3, omega4
    fourbar.angularVel(theta_2, omega, FOURBAR_LINK2);
    // find alpha3, alpha4
    fourbar.angularAccel(theta_2, omega, alpha, FOURBAR_LINK2);
    // find forces, torque
    fourbar.forceTorque(theta_2, omega, alpha, tl, X);
    printf("second solution X = %.4f \n", X);
}
