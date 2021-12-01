/* File: constangvel.ch */
#include <math.h>
#include <stdio.h>
#include <fourbar.h>
int main()
{
    double r [1:4], theta1;
    double omega2;
    int numpoints = 50;
    CFourbar fourbar;
    CPlot plota, plotb, plotc;
    /* default specification of the four-bar linkage */
    r[1] = 5;
    r[2] = 2;
    r[3] = 3;
    r[4] = 4.5;
    theta1 = deg2rad(15.0);
    omega2 = 5; /* rad/sec */
    fourbar.setLinks(r[1], r[2], r[3], r[4], theta1);
    fourbar.setAngularVel(omega2);
    fourbar.setNumPoints(numpoints);
    fourbar.plotAngularPoss(&plota, 1);
    fourbar.plotAngularVels(&plotb, 1);
    fourbar.plotAngularAccels(&plotc, 1);
    return 0;
}
