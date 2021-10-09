
#include <stdio.h>
#include <math.h>
#include <complex.h>

int main(void) {
    
    double phi1 = deg2rad(0.0),
           phi2 = deg2rad(45.0),
           r1,
           r2;
    
    complex double Z = complex(2.0, 1.0);
    
    complexsolvePP(phi1, phi2, Z, r1, r2);
    
    printf("Solution 1:\n");
    printf("r1 = %lf\n", r1);
    printf("r2 = %lf\n", r2);
    
    return 0;
}
