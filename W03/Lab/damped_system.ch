
// Starter code

#include <chplot.h>

double x_overdamped(double t) {
    return 4.2*exp(-1.57*t); // finish the equation
}

// x_critical

// x_underdamped

int main(void) {
    CPlot plot;
    
    plot.title("Step response");
    
    double t0 = 0, tf = 10, numPoints = 100;
    
    plot.func2D(t0, tf, numPoints, x_overdamped);
    // Plot other functions
    // Add legend
    
    plot.plotting();
    
    return 0;
}

