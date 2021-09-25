#include <stdio.h>
#include <math.h>

int main()
{
    double x, x0, xf, xstep, y, y0, yf, ystep, r, result;
    int i, j, nx, ny;
    printf("      x          y    sinr(x,y)\n");
    printf("  -----------------------------\n");
    x0 = -10.0;
    xf = 10.0;
    xstep = 10.0;
    nx = (xf - x0) / xstep + 1; /* num of points for x */
    y0 = -10.0;
    yf = 10.0;
    ystep = 10.0;
    ny = (yf - y0) / ystep + 1; /* num of points for y */
    for (i = 0; i < nx; i++)
    {
        x = x0 + i * xstep; /* caclulate value for x */
        for (j = 0; j < ny; j++)
        {
            y = y0 + j * ystep; /* calculate value for y */
            r = sqrt(x * x + y * y);
            result = sin(r) / r;
            printf("%10.4f %10.4f %8.4f\n", x, y, result);
        }
    }
    return 0;
}
