/* File: ch5ex15d.c */

#include <stdio.h>
#include <math.h>

int main(void)
{
    double x, x0, xf, xstep, y, y0, yf, ystep, result;
    int i, j, nx, ny;
    printf("      x          y     f8(x,y)\n");
    printf("  -----------------------------\n");
    x0 = -1.0;
    xf = 5.0;
    xstep = 1.0;
    nx = (xf - x0) / xstep + 1; /* num of points for x */
    y0 = 2.0;
    yf = 4.0;
    ystep = 0.5;
    ny = (yf - y0) / ystep + 1; /* num of points for y */
    for (i = 0; i < nx; i++)
    {
        x = x0 + i * xstep; /* calculate value for x */
        for (j = 0; j < ny; j++)
        {
            y = y0 + j * ystep; /* calculate value for y */
            result = (3 * x * x + 4 * y + 3) / (5 * sin(y * y) + 4 * x * x + 6);
            printf("%10.4f %10.4f %8.4f\n", x, y, result);
        }
    }
    return 0;
}