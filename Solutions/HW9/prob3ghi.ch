
/**
 * Problem 3 parts (g) (h) and (i)
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <fourbar.h>
#include <chplot.h>

int main(void) {
    /* Setup */
    CFourbar fourbar;
    CPlot plotx, plotv, plota, plott;
    fourbar.uscUnit(false);
    fourbar.setLinks(5.0/100, 2.0/100, 3.0/100, 4.5/100, deg2rad(15.0));
    fourbar.setCouplerPoint(2.5/100, deg2rad(30.0));
    fourbar.setNumPoints(100);
    /* Part (g) */
    fourbar.setAngularVel(15.0);
    fourbar.plotAngularPoss(&plotx, 1);
    fourbar.plotAngularVels(&plotv, 1);
    fourbar.plotAngularAccels(&plota, 1);
    /* Part (h) */
    array double x[9],
        theta_1[1:4], theta_2[1:4],
        omega_1[1:4], omega_2[1:4],
        alpha_1[1:4], alpha_2[1:4];
    theta_1[1] = deg2rad(15.0);
    theta_1[2] = deg2rad(45.0);
    theta_2[1] = deg2rad(15.0);
    theta_2[2] = deg2rad(45.0);
    omega_1[2] = 15.0;
    omega_2[2] = 15.0;
    fourbar.setMass(0.8, 2.4, 1.4);
    fourbar.setInertia(0.012, 0.119, 0.038);
    fourbar.setGravityCenter(1.25/100, 2.75/100, 2.50/100,
        deg2rad(30.0), deg2rad(15.0), deg2rad(30.0));
    fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK2);
    fourbar.angularVel(theta_1, omega_1, FOURBAR_LINK2);
    fourbar.angularVel(theta_2, omega_2, FOURBAR_LINK2);
    fourbar.angularAccel(theta_1, omega_1, alpha_1, FOURBAR_LINK2);
    fourbar.angularAccel(theta_2, omega_2, alpha_2, FOURBAR_LINK2);
    fourbar.forceTorque(theta_1, omega_1, alpha_1, 30.0, x);
    printf("Solution 1:\n%9.3lf\n", x);
    fourbar.forceTorque(theta_2, omega_2, alpha_2, 30.0, x);
    printf("Solution 2:\n%9.3lf\n", x);
    /* Part (i) */
    fourbar.plotForceTorques(&plott, 1, 30.0);
    return 0;
}