/**
 * File: prob4.ch
 * Author: Nicolas Ventura
 * Calculate the unknowns of
 * a fourbar linkage.
 */
#include <stdio.h>
#include <fourbar.h>
#include <math.h>

int main(void) {
    CFourbar fourbar;
    double theta_1[1:4], theta_2[1:4], r[1:4], rp, beta, gamma_1, gamma_2;
    double complex P_1, P_2;
    
    /* Define link lengths */
    r[1] = 5.0;
    r[2] = 2.0;
    r[3] = 3.0;
    r[4] = 4.5;
    
    /* Set theta1 and theta2 for both solutions */
    theta_1[1] = deg2rad(15.0);
    theta_2[1] = deg2rad(15.0);
    theta_1[2] = deg2rad(45.0);
    theta_2[2] = deg2rad(45.0);
    
    /* Set coupler point */
    rp = 2.5;
    beta = deg2rad(30.0);
    
    /* Set up the fourbar */
    fourbar.uscUnit(false);
    fourbar.setLinks(r[1], r[2], r[3], r[4], theta_1[1]);
    fourbar.setCouplerPoint(rp, beta);
    /* Part (a) */
    fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK2);
    /* Part (b) */
    fourbar.couplerPointPos(theta_1[2], P_1, P_2);
    /* Part (c) */
    fourbar.transAngle(gamma_1, gamma_2, theta_1[2], FOURBAR_LINK2);

    /* Display solutions */
    printf("\nFirst Solution:\n");
    printf("Theta3 = %lf rad = %lf deg\n", theta_1[3], rad2deg(theta_1[3]));
    printf("Theta4 = %lf rad = %lf deg\n", theta_1[4], rad2deg(theta_1[4]));
    printf("P = (%lf cm, %lf cm)\n", real(P_1), imag(P_1));
    printf("Gamma = %lf rad = %lf deg\n", gamma_1, rad2deg(gamma_1));

    printf("\nSecond Solution:\n");
    printf("Theta3 = %lf rad = %lf deg\n", theta_2[3], rad2deg(theta_2[3]));
    printf("Theta4 = %lf rad = %lf deg\n", theta_2[4], rad2deg(theta_2[4]));
    printf("P = (%lf cm, %lf cm)\n", real(P_2), imag(P_2));
    printf("Gamma = %lf rad = %lf deg\n", gamma_2, rad2deg(gamma_2));

    return 0;
}
