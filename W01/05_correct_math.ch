/**
 * Include math.h at the beginning of your
 * file to explicitly state that you
 * are going to be using math functions.
 */
#include <math.h>

// Want to know y = x^2 at x = 3

// Use double instead of int
double x, y;

// Use pow instead of ^
x = 3;
y = pow(x, 2);

// Remember to use %lf for printing doubles!
printf("pow(%lf, 2) = %lf\n", x, y);

/**
 * Full list of math.h functions:
 * https://www.tutorialspoint.com/c_standard_library/math_h.htm
 */
