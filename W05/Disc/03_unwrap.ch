/**
 * File: 03_unwrap.ch
 * Author: Nicolas Ventura
 * Plot the output link angle theta4
 * with a wrapped and unwrapped plot.
 */

#include <numeric.h>
#include <chplot.h>

#define N 100

int main(void) {
    /* Define variables */
    int i;
    double r[1:4], theta1;
    array double theta2[N], theta4[N], theta4uw[N];
    double complex Z;
    double theta3_1, theta3_2, theta4_1, theta4_2;
    class CPlot subplot, *plot;

    /* Fourbar Linkage */
    r[1] = 5.0;
    r[2] = 1.5;
    r[3] = 3.5;
    r[4] = 4.5;
    theta1 = deg2rad(30.0);
    linspace(theta2, 0, 2*M_PI);

    /* Calculate theta4_1 for each input angle */
    for(i = 0; i < N; i++) {
        Z = polar(r[1], theta1) - polar(r[2], theta2[i]);
        complexsolveRR(r[3], -r[4], Z, theta3_1, theta4_1, theta3_2, theta4_2);
        theta4[i] = theta4_1;
    }

    /* Call the unwrap function into the theta4uw array */
    unwrap(theta4uw, theta4);
    
    /* Create a subplot with 2 rows and 1 column */
    subplot.subplot(2, 1);
    
    /* Set the parameters for the first plot */
    plot = subplot.getSubplot(0, 0);
    plot->data2D(theta2, theta4);
    plot->title("Wrapped");
    plot->label(PLOT_AXIS_X, "Crank input: radians");
    plot->label(PLOT_AXIS_Y, "Rocker output: radians");
    
    /* Set the parameters for the second plot */
    plot = subplot.getSubplot(1, 0);
    plot->data2D(theta2, theta4uw);
    plot->title("Unwrapped");
    plot->label(PLOT_AXIS_X, "Crank input: radians");
    plot->label(PLOT_AXIS_Y, "Rocker output: radians");
    
    /* Tell Ch to render the plots as a subplot */
    subplot.plotting();
}

