/**
 * File: 02_plot.ch
 * Author: Nicolas Ventura
 * Plot the cylinder volume vs. radius.
 */

#include <math.h>   /* for pow() */
#include <chplot.h> /* for plotxy() */

#define N 100       /* number of points for plotting */

int main(void) {
    /* Declare variables for volume calculations */
    /* Not necessary to #include <array.h> since we are using primitive arrays */
    double r[N], v[N], r0, rf;
    double h; /* Cylinder height */
    int i;

    /* Set initial radius, final radius, and cylinder height */
    r0 = 0.0;
    rf = 10.0;
    h = 10.0;

    for(i = 0; i < N; i++) {                /* go through the loop N times */
        r[i] = r0 + i*(rf-r0) / (N-1);      /* linearly interpolate radius r[i] */
        v[i] = M_PI * pow(r[i], 2) * h;     /* calculate volume v[i] based on radius r[i] */
    }

    /* Call plotxy() function from chplot.h */
    plotxy(r, v, N, "Cylinder Volume vs. Radius Plot", "Radius [m]", "Volume [m^3]");
    return 0;
}
