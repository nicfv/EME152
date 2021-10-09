
#include <stdio.h>
#include <math.h>
#include <complex.h>

int main(void) {
    
    double r1 = 2.0,
           r2 = 2.5,
           phi1_1,
           phi2_1,
           phi1_2,
           phi2_2;
    
    complex double Z = complex(2.0, 1.0);
    
    complexsolveRR(r1, r2, Z, phi1_1, phi2_1, phi1_2, phi2_2);
    
    printf("Solution 1:\n");
    printf("phi1 = %lf rad\n", phi1_1);
    printf("phi2 = %lf rad\n", phi2_1);
    
    printf("Solution 2:\n");
    printf("phi1 = %lf rad\n", phi1_2);
    printf("phi2 = %lf rad\n", phi2_2);
    
    return 0;
}
