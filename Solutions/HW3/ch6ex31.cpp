/**
 * Plot the humps function.
 */

#include <math.h>
#include <chplot.h>

double humps(double x) {
    /* function to be plotted */
    return 1.0 / ((x - 0.3) * (x - 0.3) + 0.01) + 1 / ((x - 0.9) * (x - 0.9) + 0.04) - 6;
}

int main(void) {
    char *title = "Humps function", *xlabel = "x", *ylabel = "y";
    double x0 = -1, xf = 2;
    int num = 200;

    printf("humps(0.3) = %f\n", humps(0.3));
    printf("humps(0.9) = %f\n", humps(0.9));
    fplotxy(humps, x0, xf, num, title, xlabel, ylabel);
    return 0;
}
