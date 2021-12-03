#include <math.h>
#include <fourbar.h>

int main() {
    CFourbar fourbar;
    double r1 = 5, r2 = 7, r3 = 3.5, r4 = 5, theta1 = 0*M_PI/180;
    double rp = 6, beta = 45*M_PI/180; 
    double theta_1[1:4], theta_2[1:4];
    double complex p1, p2; // two solution of coupler point P
    double theta4 = 30*M_PI/180;

    theta_1[1] = theta1;
    theta_1[4] = theta4; // theta4
    theta_2[1] = theta1;
    theta_2[4] = theta4; // theta4
    fourbar.uscUnit(false);
    fourbar.setLinks(r1, r2, r3, r4, theta1); 
    fourbar.setCouplerPoint(rp, beta); 
    fourbar.angularPos(theta_1, theta_2, FOURBAR_LINK4);
    
    printf("Circuit 1: theta2 = %f, theta 3 = %f\n", theta_1[2], theta_1[3]);
    printf("Circuit 2: theta2 = %f, theta 3 = %f\n", theta_2[2], theta_2[3]);
    
    p1 = polar(r2, theta_1[2]) + polar(rp, theta_1[3] + theta_1[2]);
    p2 = polar(r2, theta_2[2]) + polar(rp, theta_2[3] + theta_2[2]);
    
    printf("Circuit 1: p = %f\n", p1);
    printf("Circuit 2: p = %f\n", p2);
    
    return 0;
}
