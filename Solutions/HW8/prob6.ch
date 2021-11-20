
/**
 * File: prob6.ch
 * Author: Nicolas Ventura
 * Run a kinematic analysis
 * on a standard crank-rocker
 * fourbar linkage.
 */

#include <fourbar.h>

#define NUMPOINTS 100

int main(void) {
    //// Create variables ////
    CFourbar fourbar;
    CPlot plot1, plot2, plotV;
    int i;
    double r[1:4], rp, beta, theta2[NUMPOINTS], t[NUMPOINTS];
    ////    SOLUTION 1           SOLUTION 2    ////
    array double
            theta_1[1:4],        theta_2[1:4],
            omega_1[1:4],        omega_2[1:4],
            alpha_1[1:4],        alpha_2[1:4],
            V_1[NUMPOINTS],      V_2[NUMPOINTS],
            theta3[NUMPOINTS],   theta4[NUMPOINTS];
    double
            gamma_1,             gamma_2;
    complex double
            P_1,                 P_2,
            Vp_1,                Vp_2,
            Ap_1,                Ap_2;

    //// Define known values ////
    r[1] = 5.0 / 100;
    r[2] = 2.0 / 100;
    r[3] = 3.0 / 100;
    r[4] = 4.5 / 100;
    rp = 2.5 / 100;
    beta = deg2rad(30.0);
    linspace(theta2, deg2rad(0.0), deg2rad(360.0));

    //// Set knowns for first solution ////
    theta_1[1] = deg2rad(15.0);
    theta_1[2] = deg2rad(45.0);
    omega_1[1] = 0.0; // rad/sec
    omega_1[2] = 15.0; // rad/sec
    alpha_1[1] = 0.0; // rad/s^2
    alpha_1[2] = 0.0; // rad/s^2

    //// Set knowns for second solution ////
    theta_2[1] = deg2rad(15.0);
    theta_2[2] = deg2rad(45.0);
    omega_2[1] = 0.0; // rad/sec
    omega_2[2] = 15.0; // rad/sec
    alpha_2[1] = 0.0; // rad/s^2
    alpha_2[2] = 0.0; // rad/s^2

    //// Basic fourbar setup ////
    fourbar.uscUnit(false);
    fourbar.setLinks(r[1], r[2], r[3], r[4], theta_1[1]);
    fourbar.setCouplerPoint(rp, beta);

    //// Part (a) ////
    fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK2);
    printf("Solution 1:\n  theta [rad] = %9.4lf", theta_1);
    printf("Solution 2:\n  theta [rad] = %9.4lf\n", theta_2);

    //// Part (b) ////
    fourbar.couplerPointPos(theta_1[2], P_1, P_2);
    printf("Solution 1:\n  P = (%9.4lf, %9.4lf) [m]\n", real(P_1), imag(P_1));
    printf("Solution 2:\n  P = (%9.4lf, %9.4lf) [m]\n\n", real(P_2), imag(P_2));

    //// Part (c) ////
    fourbar.transAngle(gamma_1, gamma_2, theta_1[2], FOURBAR_LINK2);
    printf("Solution 1:\n  gamma = %9.4lf [rad] = %9.4lf [deg]\n", gamma_1, rad2deg(gamma_1));
    printf("Solution 2:\n  gamma = %9.4lf [rad] = %9.4lf [deg]\n\n", gamma_2, rad2deg(gamma_2));

    //// Part (d) ////
    fourbar.angularVel(theta_1, omega_1, FOURBAR_LINK2);
    fourbar.angularVel(theta_2, omega_2, FOURBAR_LINK2);
    Vp_1 = fourbar.couplerPointVel(theta_1[2], theta_1[3], omega_1[2], omega_1[3]);
    Vp_2 = fourbar.couplerPointVel(theta_2[2], theta_2[3], omega_2[2], omega_2[3]);
    printf("Solution 1:\n  omega [rad/s] = %9.4lf  Vp = (%9.4lf, %9.4lf) [m/s] = %9.4lf [m/s]\n", omega_1, real(Vp_1), imag(Vp_1), cabs(Vp_1));
    printf("Solution 2:\n  omega [rad/s] = %9.4lf  Vp = (%9.4lf, %9.4lf) [m/s] = %9.4lf [m/s]\n\n", omega_2, real(Vp_2), imag(Vp_2), cabs(Vp_2));

    //// Part (e) ////
    fourbar.angularAccel(theta_1, omega_1, alpha_1, FOURBAR_LINK2);
    fourbar.angularAccel(theta_2, omega_2, alpha_2, FOURBAR_LINK2);
    Ap_1 = fourbar.couplerPointAccel(theta_1[2], theta_1[3], omega_1[2], omega_1[3], alpha_1[2], alpha_1[3]);
    Ap_2 = fourbar.couplerPointAccel(theta_2[2], theta_2[3], omega_2[2], omega_2[3], alpha_2[2], alpha_2[3]);
    printf("Solution 1:\n  alpha [rad/s^2] = %9.4lf  Ap = (%9.4lf, %9.4lf) [m/s^2] = %9.4lf [m/s^2]\n", alpha_1, real(Ap_1), imag(Ap_1), cabs(Ap_1));
    printf("Solution 2:\n  alpha [rad/s^2] = %9.4lf  Ap = (%9.4lf, %9.4lf) [m/s^2] = %9.4lf [m/s^2]\n", alpha_2, real(Ap_2), imag(Ap_2), cabs(Ap_2));

    //// Part (f) ////
	fourbar.plotAngularVels(&plot1, 1);
	fourbar.plotAngularVels(&plot2, 2);
    // Calculate the t array
    fourbar.setAngularVel(theta_1[2]);
    fourbar.angularPoss(1, t, theta3, theta4);
    for (i = 0; i < NUMPOINTS; i++) {
        // Need to re-calculate for every theta2
        theta_1[2] = theta2[i];
        theta_2[2] = theta2[i];
        fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK2);
        fourbar.angularVel(theta_1, omega_1, FOURBAR_LINK2);
        fourbar.angularVel(theta_2, omega_2, FOURBAR_LINK2);
        Vp_1 = fourbar.couplerPointVel(theta_1[2], theta_1[3], omega_1[2], omega_1[3]);
        Vp_2 = fourbar.couplerPointVel(theta_2[2], theta_2[3], omega_2[2], omega_2[3]);
        // Store Vp_1 and Vp_2 into the array
        V_1[i] = cabs(Vp_1);
        V_2[i] = cabs(Vp_2);
    }
    plotV.title("Coupler Point Velocity");
    plotV.data2D(t, V_1);
    plotV.data2D(t, V_2);
    plotV.legend("Solution 1", 0);
    plotV.legend("Solution 2", 1);
	plotV.label(PLOT_AXIS_X, "Time [s]");
	plotV.label(PLOT_AXIS_Y, "Velocity [m/s]");
    plotV.plotting();
    
    return 0;
}
