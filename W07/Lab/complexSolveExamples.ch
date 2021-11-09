
#include <stdio.h>
#include <complex.h>

void examplePR(double theta1, double r2, complex double Z) {
    int num;
    double r1_1, theta2_1, r1_2, theta2_2;
    
    // Solve the equation R1e^(i*theta1) + R2e(i*theta2) = Z
    num = complexsolvePR(theta1, r2, Z, r1_1, theta2_1, r1_2, theta2_2);
    
    printf("Number of solutions = %d\n", num);
    printf("\nSolution 1:\n");
    printf("R1 = %lf m\n", r1_1);
    printf("Theta2 = %lf rad = %lf deg\n", theta2_1, rad2deg(theta2_1));
    printf("\nSolution 2:\n");
    printf("R2 = %lf m\n", r1_2);
    printf("Theta2 = %lf rad = %lf deg\n", theta2_2, rad2deg(theta2_2));
}

void exampleRR(double r1, double r2, complex double Z) {
    int num;
    double theta1_1, theta2_1, theta1_2, theta2_2;
    
    // Solve the equation R1e^(i*theta1) + R2e(i*theta2) = Z
    num = complexsolveRR(r1, r2, Z, theta1_1, theta2_1, theta1_2, theta2_2);
    
    printf("Number of solutions = %d\n", num);
    printf("\nSolution 1:\n");
    printf("Theta1 = %lf rad = %lf deg\n", theta1_1, rad2deg(theta1_1));
    printf("Theta2 = %lf rad = %lf deg\n", theta2_1, rad2deg(theta2_1));
    printf("\nSolution 2:\n");
    printf("Theta1 = %lf rad = %lf deg\n", theta1_2, rad2deg(theta1_2));
    printf("Theta2 = %lf rad = %lf deg\n", theta2_2, rad2deg(theta2_2));
}

int main(void) {
    // Print the solutions to the equation R1e^(i45) + 3.0e^(i*theta2) = 1 + i2
    // examplePR(deg2rad(45.0), 3.0, complex(1.0, 2.0));
    // Print the solutions to the equation 2e^(i*theta1) + 3.5e^(i*theta2) = 3 - i
    exampleRR(2.0, 3.5, complex(3.0, -1.0));
    return 0;
}
