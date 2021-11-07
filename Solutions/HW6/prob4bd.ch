/* h5p5.ch */
#include <math.h>
#include <complex.h>
#include <array.h>
#include <chplot.h>

#define NUMPOINTS 361
#define DEG2RAD(a) ((M_PI/180)*a)
#define RAD2DEG(a) ((180/M_PI)*a)

/* Consult Figure P3.50 in the Mechanism Design textbook. */

int main() {
    int n1, n2;
    double r[1:7], theta1, rp, beta, theta6;

    int i;
    double theta2[NUMPOINTS],
           theta3_1[NUMPOINTS], theta3_2[NUMPOINTS],
           x1, x2, x3, x4;
    array double theta4_1[NUMPOINTS], theta4_2[NUMPOINTS],
          theta5_1_1[NUMPOINTS], theta5_1_2[NUMPOINTS],
          theta5_2_1[NUMPOINTS], theta5_2_2[NUMPOINTS];
    double complex z,
                   P_1[NUMPOINTS], P_2[NUMPOINTS],
                   B_1[NUMPOINTS], B_2[NUMPOINTS]; 

    array double r6_1_1[NUMPOINTS], r6_1_2[NUMPOINTS], 
          r6_2_1[NUMPOINTS], r6_2_2[NUMPOINTS];
    class CPlot mainplot1;
    class CPlot mainplot2;
    class CPlot* subplot;
    int branches[NUMPOINTS];

    //-------------------------Part A----------------------------------
    //Determine theta4, point B on the output link, and coupler point P
    //-----------------------------------------------------------------

    // Define the fourbar linkage 
    n1 = 2; 
    n2 = 4;
    r[1] = 6; 
    r[2] = 1; 
    r[3] = 3; 
    r[4] = 5;
    r[5] = 4;
    r[7] = r[4] - 1; /* Length of B0 - C */
    theta1 = DEG2RAD(-30);
    rp = 2.5; 
    beta = DEG2RAD(20);
    theta6 = 0;

    // Analyze the fourbar with theta2 rotating from 0-360
    for(i=0; i<=360; i++) {
        theta2[i] = DEG2RAD(i);

        // Determine theta3 and theta4
        z = polar(r[1], theta1) - polar(r[2], theta2[i]);
        branches[i] = complexsolve(n1, n2, r[3], -r[4], z, x1, x2, x3, x4);
        
        // First set of solutions
        theta3_1[i] = x1;
        theta4_1[i] = x2;
        P_1[i] = polar(r[2], theta2[i]) + polar(rp, theta3_1[i]+beta);
        B_1[i] = polar(r[2], theta2[i]) + polar(r[3], theta3_1[i]);

        // Second set of solutions
        theta3_2[i] = x3;
        theta4_2[i] = x4;
        P_2[i] = polar(r[2], theta2[i]) + polar(rp, theta3_2[i]+beta);
        B_2[i] = polar(r[2], theta2[i]) + polar(r[3], theta3_2[i]);

        // Find solutions for r5 and r6 : Circuit 1
        complexsolve(1, 4, theta6, -r[5], 
            polar(r[1], theta1) + polar(r[7], theta4_1[i]),
            x1, x2, x3, x4 );
        r6_1_1[i] = x1;
        theta5_1_1[i] = x2;
        r6_1_2[i] = x3;
        theta5_1_2[i] = x4;

        // Find solutions for r5 and r6 : Circuit 2
        complexsolve(1, 4, theta6, -r[5], 
            polar(r[1], theta1) + polar(r[7], theta4_2[i]),
            x1, x2, x3, x4 );
        r6_2_1[i] = x1;
        theta5_2_1[i] = x2;
        r6_2_2[i] = x3;
        theta5_2_2[i] = x4;
    }
    // Smooth theta4_1, theta4_2 
    unwrap(theta4_1, theta4_1);
    unwrap(theta4_2, theta4_2);
    unwrap(theta5_1_2, theta5_1_2);
 
    // Convert required angles from radian to degree 
    for(i=0; i<=360; i++) {
        theta2[i] = RAD2DEG(theta2[i]);
        theta3_1[i] = RAD2DEG(theta3_1[i]);
        theta3_2[i] = RAD2DEG(theta3_2[i]);
        theta4_1[i] = RAD2DEG(theta4_1[i]);
        theta4_2[i] = RAD2DEG(theta4_2[i]);
        theta5_1_1[i] = RAD2DEG(theta5_1_1[i]);
        theta5_1_2[i] = RAD2DEG(theta5_1_2[i]);
        theta5_2_1[i] = RAD2DEG(theta5_2_1[i]);
        theta5_2_2[i] = RAD2DEG(theta5_2_2[i]);
    }

    printf("At 45 degrees, \n");
    printf("branches = %d\n", branches[45]);
    printf("Circuit 1:\n");
    printf("theta3 = %lf\n", theta3_1[45]);
    printf("theta4 = %lf\n", theta4_1[45]);
    printf("theta5 = %lf\n", theta5_1_1[45]);
    printf("r6 = %lf\n", r6_1_1[45]);
    printf("P = %lf\n", P_1[45]);
    printf("\nCircuit 2:\n");
    printf("theta3 = %lf\n", theta3_2[45]);
    printf("theta4 = %lf\n", theta4_2[45]);
    printf("theta5 = %lf\n", theta5_2_1[45]);
    printf("r6 = %lf\n", r6_2_1[45]);
    printf("P = %lf\n", P_2[45]);
    printf("\nCircuit 3:\n");
    printf("theta3 = %lf\n", theta3_1[45]);
    printf("theta4 = %lf\n", theta4_1[45]);
    printf("theta5 = %lf\n", theta5_1_2[45]);
    printf("r6 = %lf\n", r6_1_2[45]);
    printf("P = %lf\n", P_1[45]);
    printf("\nCircuit 4:\n");
    printf("theta3 = %lf\n", theta3_2[45]);
    printf("theta4 = %lf\n", theta4_2[45]);
    printf("theta5 = %lf\n", theta5_2_2[45]);
    printf("r6 = %lf\n", r6_2_2[45]);
    printf("P = %lf\n", P_2[45]);

    /* Display Plots */
    mainplot1.subplot(3,2);
    subplot=mainplot1.getSubplot(0,0);
    subplot->data2D(theta2, theta4_1);
    subplot->title("theta4 vs. theta2 (1st solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"theta4 (degree)");

    subplot=mainplot1.getSubplot(1,0);
    subplot->data2D(theta2, theta5_1_1);
    subplot->title("theta5 vs. theta2 (1st circuit, 1st solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"theta5 (degree)");

    subplot=mainplot1.getSubplot(1,1);
    subplot->data2D(theta2, r6_1_1);
    subplot->title("r6 vs. theta2 (1st circuit, 1st solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"r6 (m)");

    subplot=mainplot1.getSubplot(2,0);
    subplot->data2D(theta2, theta5_1_2);
    subplot->title("theta5 vs. theta2 (1st circuit, 2nd solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"theta5 (degree)");

    subplot=mainplot1.getSubplot(2,1);
    subplot->data2D(theta2, r6_1_2);
    subplot->title("r6 vs. theta2 (1st circuit, 2nd solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"r6 (m)");

    mainplot1.plotting();

    /* Display Plots */
    mainplot2.subplot(3,2);
    subplot=mainplot2.getSubplot(0,0);
    subplot->data2D(theta2, theta4_2);
    subplot->title("theta4 vs. theta2 (2nd solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"theta4 (degree)");

    subplot=mainplot2.getSubplot(1,0);
    subplot->data2D(theta2, theta5_2_1);
    subplot->title("theta5 vs. theta2 (2nd circuit, 1st solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"theta5 (degree)");

    subplot=mainplot2.getSubplot(1,1);
    subplot->data2D(theta2, r6_2_1);
    subplot->title("r6 vs. theta2 (2nd circuit, 1st solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"r6 (m)");

    subplot=mainplot2.getSubplot(2,0);
    subplot->data2D(theta2, theta5_2_2);
    subplot->title("theta5 vs. theta2 (2nd circuit, 2nd solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"theta5 (degree)");

    subplot=mainplot2.getSubplot(2,1);
    subplot->data2D(theta2, r6_2_2);
    subplot->title("r6 vs. theta2 (2nd circuit, 2nd solution)");
    subplot->label(PLOT_AXIS_X,"theta2 (degree)");
    subplot->label(PLOT_AXIS_Y,"r6 (m)");

    mainplot2.plotting();
    return 0;
}
