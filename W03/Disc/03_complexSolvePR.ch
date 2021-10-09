
#include <stdio.h>
#include <math.h>
#include <complex.h>

int main(void) {
    
    double r1 = 1.5,
           phi2 = deg2rad(45.0),
           r2_1,
           phi1_1,
           r2_2,
           phi1_2;
    
    complex double Z = complex(2.0, 1.0);
    
    complexsolvePR(phi2, r1, Z, r2_1, phi1_1, r2_2, phi1_2);
    
    printf("Solution 1:\n");
    printf("phi1 = %lf rad\n", phi1_1);
    printf("r2 = %lf\n", r2_1);
    
    printf("Solution 2:\n");
    printf("phi1 = %lf rad\n", phi1_2);
    printf("r2 = %lf\n", r2_2);
    
    return 0;
}
