
/**
 * File: prob4.ch
 * Author: Nicolas Ventura
 * Synthesize a 4 bar mechanism.
 */

#include <fourbar.h>

int main(void) {
    double r [1:4];
    double psi [1:3], phi [1:3];
    double theta [1:4], theta3 [1:3];
    CFourbar fourbar;
    /* specify input/output relation for a four-bar linkage */
    r[1] = 1;
    psi[1] = 60.0 * M_PI / 180;
    psi[2] = 90.0 * M_PI / 180;
    psi[3] = 120.0 * M_PI / 180;
    phi[1] = 100.0 * M_PI / 180;
    phi[2] = 150.0 * M_PI / 180;
    phi[3] = 200.0 * M_PI / 180;
    fourbar.synthesis(r, phi, psi);
    /* display link lengths */
    printf("r2 = %.3f, r3 = %.3f, r4 = %.3f\n", r[2], r[3], r[4]);
    /* obtain theta3 in three positions and display these positions */
    theta[1] = 0;
    fourbar.setLinks(r[1], r[2], r[3], r[4], theta[1]);
    // phi1, psi1
    theta[2] = phi[1];
    theta[4] = psi[1];
    fourbar.getAngle(theta, FOURBAR_LINK3);
    theta3[1] = theta[3];
    // phi2, psi2
    theta[2] = phi[2];
    theta[4] = psi[2];
    fourbar.getAngle(theta, FOURBAR_LINK3);
    theta3[2] = theta[3];
    // psi3, psi3
    theta[2] = phi[3];
    theta[4] = psi[3];
    fourbar.getAngle(theta, FOURBAR_LINK3);
    theta3[3] = theta[3];
    fourbar.displayPositions(phi, theta3, psi);
    return 0;
}
