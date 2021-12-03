
/**
 * File: prob3.ch
 * Author: Nicolas Ventura
 * Midterm problem 3:
 * Calculate r3 and theta3.
 */

#include <math.h>
#include <stdio.h>

int main(void) {
    double r1 = 5.0, r2 = 6.0, r3,
        theta2 = deg2rad(60.0), theta3;

    r3 = sqrt(pow(r2*cos(theta2)-r1, 2) +
        pow(r2*sin(theta2), 2));
    
    theta3 = 2*atan2(r3-r2*cos(theta2)+r1, r2*sin(theta2));

    printf("r3 = %9.3lf in\n", r3);
    printf("t3 = %9.3lf rad\n", theta3);
    printf("   = %9.3lf deg\n", rad2deg(theta3));

    return 0;
}