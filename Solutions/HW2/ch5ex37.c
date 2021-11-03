/**
 * Calculate machine epsilon using while loops.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <float.h>

int main(void) {
    float epsilon;
    double depsilon;
    /* Compute float epsilon */
    epsilon = 1.0f;
    while (epsilon + 1.0f > 1.0f) {
        epsilon /= 2.0f;
    }
    epsilon *= 2.0;
    printf("The float machine epsilon is  %e\n", epsilon);
    printf("FLT_EPSILON is                %e\n", FLT_EPSILON);
    /* Compute double epsilon */
    depsilon = 1.0;
    while (depsilon + 1.0 > 1.0) {
        depsilon /= 2.0;
    }
    depsilon *= 2.0;
    printf("The double machine epsilon is %e\n", depsilon);
    printf("DBL_EPSILON is                %e\n", DBL_EPSILON);
    return 0;
}
