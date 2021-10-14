
#include <stdio.h>
#include <math.h>
#include <complex.h>

/**
 * Solve the following equation for r and theta (2 solutions):
 *
 * (1.8 + i*r)e^(i*theta) = 2 + i
 */

int main(void) {
    
    double a = 1.8,
           r_1,
           r_2,
           theta_1,
           theta_2;
    
    complex double Z = complex(2.0, 1.0);
    
    complexsolveRP(a, Z, r_1, theta_1, r_2, theta_2);
    
    printf("Solution 1:\n");
    printf("r = %lf\n", r_1);
    printf("theta = %lf rad\n", theta_1);
    
    printf("Solution 2:\n");
    printf("r = %lf\n", r_2);
    printf("theta = %lf rad\n", theta_2);
    
    return 0;
}
