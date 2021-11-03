#include <stdio.h>
#include <math.h>
#include <chplot.h>

#define NUM_POINTS 100

double f4(double x)
{
    double retval;

    retval = (3 * x * x + 4 * x + 3) / (5 * sin(x * x) + 4 * x * x + 3);
    return retval;
}

int main()
{
    double x, x0, xf, xstep, result;
    int i, n;

    printf("    x       f4(x)\n");
    printf("  ---------------\n");
    x0 = -1.0;                 /* initial value for x */
    xf = 5.0;                  /* final value for x */
    xstep = 0.25;              /* step size for x */
    n = (xf - x0) / xstep + 1; /* number of points */
    for (i = 0; i < n; i++)
    {
        x = x0 + i * xstep; /* calculate value x */
        result = f4(x);
        printf("%8.4f %8.4f\n", x, result);
    }
    fplotxy(f4, x0, xf, NUM_POINTS, "function f4(x)", "x", "y");
    return 0;
}
