/**
 * Render a plot of the transmission angle
 * of the fourbar linkage.
 * Author: Nicolas Ventura
 */

#include <fourbar.h>

#define N 100

int main(void) {
    double r[1:4], theta1;
    r[1] = 1.2;
    r[2] = 0.4;
    r[3] = 1.5;
    r[4] = 1.0;
    theta1 = deg2rad(-10.0);
    /* Set up the CFourbar class */
    CFourbar fourbar;
    CPlot plota, plotb;
    fourbar.setLinks(r[1], r[2], r[3], r[4], theta1);
    fourbar.setNumPoints(N);
    /* Call the plotTransAngles() function to plot the transmission angle gamma */
    fourbar.plotTransAngles(&plota, 1);
    fourbar.plotTransAngles(&plotb, 2);
    fourbar.animation(1);
    return 0;
}
