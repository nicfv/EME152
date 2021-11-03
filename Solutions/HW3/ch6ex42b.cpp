/* Find the cubic root of 3 */
#include <stdio.h>
#include <math.h>  /* for fabs() */
#include <float.h> /* for FLT_EPSILON */

#define NUM_POINTS 100 /* number of points for plotting */
#define N 100

double a = 3.0;

/* function for x^3 - 3 */
double func(double x)
{
  double retval;

  retval = x * x * x - a;
  return retval;
}

/* derivative of function */
double funcp(double x)
{
  double retval;

  retval = 3 * x * x;
  return retval;
}

int main(void)
{
  int i;
  double x0, xf, x1, x2;

  x0 = -5.0; /* initial value for x */
  xf = 5.0;  /* final value for x */

  fplotxy(func, x0, xf, NUM_POINTS, "function f(x)", "x", "f(x)");

  x1 = 2.0;
  for (i = 1; i <= N; i++)
  {
    x2 = x1 - func(x1) / funcp(x1);
    if (fabs(x2 - x1) < FLT_EPSILON)
      break;
    x1 = x2;
  }
  if (i < N)
  {
    printf("x = %f\n", x2);
    printf("func(%f) = %f\n", x2, func(x2));
  }
  else
  {
    printf("Newton's method failed to converge\n");
  }
  return 0;
}
