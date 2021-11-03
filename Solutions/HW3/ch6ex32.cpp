/**
 * Plot the peaks function.
 */

#include <math.h>
#include <chplot.h>

double peaks(double x, double y) {
    // function to be plotted
    return 3 * (1 - x) * (1 - x) * exp(-(x * x) - (y + 1) * (y + 1)) - 10 * (x / 5 - x * x * x - pow(y, 5)) * exp(-x * x - y * y) - 1 / 3 * exp(-(x + 1) * (x + 1) - y * y);
}

int main(void) {
    char *title = "Peaks function", *xlabel = "x", *ylabel = "y", *zlabel = "z";
    double x0 = -3, xf = 3, y0 = -4, yf = 4;
    int x_num = 60, y_num = 80;

    fplotxyz(peaks, x0, xf, y0, yf, x_num, y_num, title, xlabel, ylabel, zlabel);
    printf("peaks(1.5, 2.5) = %f\n", peaks(1.5, 2.5));
    return 0;
}
