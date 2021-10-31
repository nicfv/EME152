#include <numeric.h>
#include <complex.h>
#include <chplot.h>
int main() {
    double r[1:4], theta1, theta31;
    int n1 = 2, n2 = 4, i;
    double complex z, p, rb;
    double x1, x2, x3, x4;
    array double theta2[36], theta4[36], theta41[36];
    class CPlot plot2, plot3;
    /* four-bar linkage */
    r[1] = 5;
    r[2] = 1.5;
    r[3] = 3.5;
    r[4] = 4;
    theta1 = 30 * M_PI / 180;
    linspace(theta2, 0, 2*M_PI);
    for (i = 0; i < 36; i++) {
        z = polar(r[1], theta1) - polar(r[2], theta2[i]);
        complexsolve(n1, n2, r[3], -r[4], z, x1, x2, x3, x4);
        theta4[i] = x2;
    }
    
    plot2.data2D(theta2, theta4);
    plot2.title("Wrapped");
    plot2.label(PLOT_AXIS_X, "Crank input: radians");
    plot2.label(PLOT_AXIS_Y, "Rocker output: radians");
    plot2.plotting();
    
    plot3.data2D(theta2, theta41);
    plot3.title("Unwrapped");
    plot3.label(PLOT_AXIS_X, "Crank input: radians");
    plot3.label(PLOT_AXIS_Y, "Rocker output: radians");
    plot3.plotting();
}
