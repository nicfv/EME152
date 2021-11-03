/**
 * Compute the law of cosines.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>

int main(void) {
    double a, b, c, gamma;
    a = 3.83;
    b = 5;
    c = 6;
    gamma = acos((a * a + b * b - c * c) / (2 * a * b));
    printf("gamma in radian = %lf\n", gamma);
    printf("gamma in degree = %lf\n", gamma * 180 / M_PI);
    return 0;
}
