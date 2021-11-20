/**
 * File: quick.ch
 * Author: Nicolas Ventura
 */

#include "quickreturn.h" // Include the header file

int main(void) {
    CQuickReturn qr;
    int numpoints = 100; // Number of frames to animate

    bool unit = SI; // SI units are in meters
    double r1 = 2.5/100,
        r2 = 1.0/100,
        r4 = 6.5/100,
        r5 = 3.0/100,
        r6,
        r7 = 5.0/100;
    double theta1 = deg2rad(90.0),
        theta2 = deg2rad(30.0),
        theta3, theta4;

    qr.uscUnit(unit);
    qr.setLinks(r1, r2, r4, r5, r7, theta1);
    qr.setNumPoints(numpoints);
    
    /* Problem 5 */
    theta3 = qr.getAngPos(theta2, 3);
    theta4 = qr.getAngPos(theta2, 4);
    r6 = qr.sliderPos(theta2);
    printf("Theta3 = %lf rad = %lf deg\n", theta3, rad2deg(theta3));
    printf("Theta4 = %lf rad = %lf deg\n", theta4, rad2deg(theta4));
    printf("r6 = %lf m\n", r6);
    /* Part (a) */
    qr.displayPosition(theta2, QANIMATE_OUTPUTTYPE_DISPLAY);
    /* Part (b) */
    qr.animation(QANIMATE_OUTPUTTYPE_DISPLAY);
    return 0;
}
