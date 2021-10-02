
#include <stdio.h>
#include <array.h>

int main(void)
{
  array double x[2] = {2, 8};
  array double y[2] = {3, 4};
  array double z[2];

  // computes the array { 2+3 , 8+4 }
  z = x + y;

  printf("%lf\n", z);

  // computes the array { 2-3 , 8-4 }
  z = x - y;

  printf("%lf\n", z);

  // computes the array { 2*3 , 8*4 }
  z = x .* y;

  printf("%lf\n", z);

  // computes the array { 2/3 , 8/4 }
  z = x ./ y;

  printf("%lf\n", z);

  return 0;
}
