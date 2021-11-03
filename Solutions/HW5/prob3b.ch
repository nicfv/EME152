/*prob3b.ch*/

#include <stdio.h>
#include <numeric.h>

#define DEG2RAD(x) ((x)*M_PI/180.0)
#define RAD2DEG(x) ((x)*180.0/M_PI)

int main () {
    double r1, r2, r3, r4;
    double complex z3;
    double theta1;
    double rp;
    double beta;
    double theta2;

    /* Two of each of these for 2 separate circuits */
    double complex P[2];
    double complex B[2];
    double theta3[2];
    double theta4[2];

    r1 = getnum("Please enter the length of R1 [5.5]: ", 5.5); 
    r2 = getnum("Please enter the length of R2 [1.0]: ", 1.0);
    r3 = getnum("Please enter the length of R3 [3.0]: ", 3.0);
    r4 = getnum("Please enter the length of R4 [4.5]: ", 4.5);
    theta1 = getnum("Please enter the angle of theta1 in degrees [10.0]: ", 10.0);
    theta1 = DEG2RAD(theta1);
    rp = getnum("Please enter the length r_p [2.5]: ", 2.5);
    beta = getnum("Please enter the angle Beta in degrees [30.0]: ", 30.0);
    beta = DEG2RAD(beta);
    theta2 = getnum("Please enter the angle theta2 in degrees [45.0]: ", 45.0);
    theta2 = DEG2RAD(theta2);
    z3 = polar(r1, theta1) - polar(r2, theta2);
    complexsolveRR(r3, -r4, z3, theta3[0], theta4[0], theta3[1], theta4[1]);

    B[0] = polar(r2, theta2) + polar(r3, theta3[0]);
    B[1] = polar(r2, theta2) + polar(r3, theta3[1]);

    P[0] = polar(r2, theta2) + polar(rp, theta3[0] + beta);
    P[1] = polar(r2, theta2) + polar(rp, theta3[1] + beta);

    printf("CIRCUIT 1\n");
    printf("theta3_1 = %7.4lf (radian) = %7.4lf (degree), theta4_1 = %7.4lf (radian) = %7.4lf (degree)\n", theta3[0], RAD2DEG(theta3[0]), theta4[0], RAD2DEG(theta4[0]));
    printf("B(%lf,%lf) \nP(%lf,%lf)\n", real(B[0]), imag(B[0]), real(P[0]), imag(P[0]));

    
    printf("\nCIRCUIT 2\n");
    printf("theta3_1 = %7.4lf (radian) = %7.4lf (degree), theta4_1 = %7.4lf (radian) = %7.4lf (degree)\n", theta3[1], RAD2DEG(theta3[1]), theta4[1], RAD2DEG(theta4[1]));
    printf("B(%lf,%lf) \nP(%lf,%lf)\n", real(B[1]), imag(B[1]), real(P[1]), imag(P[1]));
    
    return 0;
}
