/**
 * Evaluate g8(x, y) for x=3.5 and y=4.2
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>
int main(void) {
    double x = 3.5;
    double y = 4.2;
    double result;
    result = (3 * x * x + 4 * y + 3) / (5 * sin(y * y) + 4 * x * x + 6);
    printf("g8(%lf, %lf) = %lf\n", x, y, result);
    return 0;
}