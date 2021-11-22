/*************************************************************
* File: 02_plotForceTorques.ch
* This example plots the joint forces and output torque curves.
**************************************************************/
#include <fourbar.h>
int main(void) {
    CFourbar fourbar;
    double r1 = 0.12, r2 = 0.04, r3 = 0.10, r4 = 0.07;
    double theta1 = 10;
    double rg2 = 0.0508, rg3 = 0.1524, rg4 = 0.0889;
    double delta2 = 0.0, delta3 = 0, delta4 = 0.0;
    double m2 = 0.3628, m3 = 1.0833, m4 = 0.6348;
    double ig2 = 0.001356, ig3 = 0.013445, ig4 = 0.004293, tl = 0;
    int numpoints = 50;
    double omega2 = 5; /* constant omega2 */
    CPlot plot, plot2;
    /* initialization of link parameters and
    inertia properties */
    fourbar.uscUnit(true);
    fourbar.setLinks(r1, r2, r3, r4, theta1);
    fourbar.setGravityCenter(rg2, rg3, rg4, delta2, delta3, delta4);
    fourbar.setInertia(ig2, ig3, ig4);
    fourbar.setMass(m2, m3, m4);
    fourbar.setNumPoints(numpoints);
    fourbar.setAngularVel(omega2);
    fourbar.plotForceTorques(&plot, 1, tl); //first branch
    fourbar.plotForceTorques(&plot2, 2, tl); // second branch
}
