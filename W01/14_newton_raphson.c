/* File: sqrtx.c Calculate square root sqrt(a) for a = 3.0 using Newton's method */
#include <stdio.h>
#include <math.h>  /* for fabs() */
#include <float.h> /* for FLT_EPSILON */
#define N 100      /* the maximum number of iteration */
int main()
{
    int i;
    double a, x0, x1, x2;
    a = 3.0; /* sqrt(a) with a = 0.3 */
    x0 = a;  /* an initial guess for x0 */
    x1 = x0; /* set x1 to x0 */
    for (i = 1; i <= N; i++)
    {
        x2 = (x1 + a / x1) / 2.0; /* Newton's recursive formula */
        if (fabs(x2 - x1) < FLT_EPSILON)
            break;
        x1 = x2; /* update value x1 for next iteration */
    }
    if (i < N)
    { /* number of iteration is less than N */
        printf("sqrtx(%.2f) = %f\n", a, x2);
        printf("sqrt(%.2f)  = %f\n", a, sqrt(a));
        printf("Number of iterations = %d\n", i);
    }
    else
    { /* number of iteration equals N */
        printf("sqrtx failed to converge\n");
    }
    return 0;
}
