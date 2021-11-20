#include <fourbar.h>
int main() {
    double r[1:4], theta1;
    double omega2;
    int numpoints = 50;
    CFourbar fourbar;
    CPlot plot1, plot2;
    /* default specification of the four-bar linkage */
    r[1] = 12;
    r[2] = 4;
    r[3] = 12;
    r[4] = 7;
    theta1 = 10 * M_PI / 180;
    omega2 = 5; /* rad/sec */
    fourbar.setLinks(r[1], r[2], r[3], r[4], theta1);
    fourbar.setAngularVel(omega2);
    fourbar.setNumPoints(numpoints);
    fourbar.plotAngularVels(&plot1, 1);
    fourbar.plotAngularVels(&plot1, 2);
}
