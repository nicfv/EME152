#include <stdio.h> /* for printf() */
#include <math.h>  /* for sin() and fabs() */
#include <float.h> /* for FLT_EPSILON */

int main()
{
    double x, x0, xf, xstep, result;
    int i, n;
    printf("    x      sinc(x)\n");
    printf("  ---------------\n");
    x0 = -10.0;                /* initial value */
    xf = 10.0;                 /* final value */
    xstep = 5.0;               /* step size */
    n = (xf - x0) / xstep + 1; /* numof points */
    for (i = 0; i < n; i++)
    {
        x = x0 + i * xstep; /* value x */
        if (fabs(x) < FLT_EPSILON)
            result = 1.0;
        else
            result = sin(x) / x;
        printf("%8.4f %8.4f\n", x, result);
    }
    return 0;
}
