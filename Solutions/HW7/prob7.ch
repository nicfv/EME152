
/**
 * File: prob7.ch
 * Animate a quickreturn mechanism
 * with theta2=45 and in steps of
 * 1 degrees.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <complex.h>
#include <array.h>
#include <chplot.h>

#define NUMPOINTS 361

int main(void) {
    int n1, n2;
    double r [1:7], theta1, rp, beta, theta6;
    complex double L [1:8];

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
    class CPlot *subplot;
    int branches[NUMPOINTS];

    FILE *fp;
    double sliderWidth, sliderHeight;

    /*********************************************************************
     * Determine theta4, point B on the output link, and coupler point P *
     *********************************************************************/

    // Define the fourbar linkage
    n1 = 2;
    n2 = 4;
    r[1] = 6;
    r[2] = 1;
    r[3] = 3;
    r[4] = 5;
    r[5] = 4;
    r[7] = r[4] - 1; /* Length of B0 - C */
    theta1 = deg2rad(-30);
    rp = 2.5;
    beta = deg2rad(20);
    theta6 = 0;

    // Analyze the fourbar with theta2 rotating from 0-360
    for (i = 0; i <= 360; i++) {
        theta2[i] = deg2rad(i);

        // Determine theta3 and theta4
        z = polar(r[1], theta1) - polar(r[2], theta2[i]);
        branches[i] = complexsolve(n1, n2, r[3], -r[4], z, x1, x2, x3, x4);

        // First set of solutions
        theta3_1[i] = x1;
        theta4_1[i] = x2;
        P_1[i] = polar(r[2], theta2[i]) + polar(rp, theta3_1[i] + beta);
        B_1[i] = polar(r[2], theta2[i]) + polar(r[3], theta3_1[i]);

        // Second set of solutions
        theta3_2[i] = x3;
        theta4_2[i] = x4;
        P_2[i] = polar(r[2], theta2[i]) + polar(rp, theta3_2[i] + beta);
        B_2[i] = polar(r[2], theta2[i]) + polar(r[3], theta3_2[i]);

        // Find solutions for r5 and r6 : Circuit 1
        complexsolve(1, 4, theta6, -r[5],
                     polar(r[1], theta1) + polar(r[7], theta4_1[i]),
                     x1, x2, x3, x4);
        r6_1_1[i] = x1;
        theta5_1_1[i] = x2;
        r6_1_2[i] = x3;
        theta5_1_2[i] = x4;

        // Find solutions for r5 and r6 : Circuit 2
        complexsolve(1, 4, theta6, -r[5],
                     polar(r[1], theta1) + polar(r[7], theta4_2[i]),
                     x1, x2, x3, x4);
        r6_2_1[i] = x1;
        theta5_2_1[i] = x2;
        r6_2_2[i] = x3;
        theta5_2_2[i] = x4;
    }
    // Smooth theta4_1, theta4_2
    unwrap(theta4_1, theta4_1);
    unwrap(theta4_2, theta4_2);
    unwrap(theta5_1_2, theta5_1_2);

    /* Part (a) */

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

    /* Part (b) */

    fp = fopen("partb.qnm", "w");
    if (fp == NULL) {
        printf("Could not open animation file.\n");
        exit(1);
    }

    sliderWidth = 0.30;
    sliderHeight = 0.20;

    L[1] = complex(0, 0);
    L[2] = polar(r[2], deg2rad(45.0));
    L[3] = L[2] + polar(r[3], theta3_1[45]);
    L[4] = L[3] - polar(r[4], theta4_1[45]);
    L[5] = L[4] + polar(r[7], theta4_1[45]); // r4'
    L[6] = complex(r6_1_1[45], 0);
    L[7] = P_1[45];

    fprintf(fp, "title \"Part B\"\n");
    fprintf(fp, "fixture\n");
    fprintf(fp, "groundpin 0 0\n");
    fprintf(fp, "groundpin %lf %lf\n", real(L[4]), imag(L[4]));
    fprintf(fp, "ground %lf %lf %lf %lf\n",
            real(L[6]) - sliderWidth, imag(L[6]) - sliderHeight / 2, real(L[6]) + sliderWidth, imag(L[6]) - sliderHeight / 2);
    fprintf(fp, "link 0 0 %lf %lf %lf %lf %lf %lf\n",
            real(L[2]), imag(L[2]),
            real(L[3]), imag(L[3]),
            real(L[4]), imag(L[4]));
    fprintf(fp, "link %lf %lf %lf %lf\n",
            real(L[5]), imag(L[5]),
            real(L[6]), imag(L[6]));
    fprintf(fp, "rectangle %lf %lf %lf %lf\n",
            real(L[6]) - sliderWidth / 2, imag(L[6]) - sliderHeight / 2, sliderWidth, sliderHeight);
    fprintf(fp, "polygon fill gray90 %lf %lf %lf %lf %lf %lf\n",
            real(L[2]), imag(L[2]),
            real(L[3]), imag(L[3]),
            real(L[7]), imag(L[7]));
    fprintf(fp, "point %lf %lf\n", real(L[7]), imag(L[7]));

    fclose(fp);

    qanimate partb.qnm

    /* Part (c) */

    fp = fopen("partc.qnm", "w");
    if (fp == NULL) {
        printf("Could not open animation file.\n");
        exit(1);
    }

    sliderWidth = 0.30;
    sliderHeight = 0.20;

    fprintf(fp, "title \"Part C\"\n");
    fprintf(fp, "fixture\n");
    fprintf(fp, "groundpin 0 0\n");
    fprintf(fp, "groundpin %lf %lf\n", real(L[4]), imag(L[4]));
    fprintf(fp, "ground %lf %lf %lf %lf\n",
            min(r6_1_1) - sliderWidth / 2, -sliderHeight / 2, max(r6_1_1) + sliderWidth / 2, -sliderHeight / 2);
    fprintf(fp, "animate restart\n\n");

    for (i = 0; i < NUMPOINTS; i++) {
        fprintf(fp, "# frame %d\n", i);

        L[1] = complex(0, 0);
        L[2] = polar(r[2], deg2rad((double)(i)));
        L[3] = L[2] + polar(r[3], theta3_1[i]);
        L[4] = L[3] - polar(r[4], theta4_1[i]);
        L[5] = L[4] + polar(r[7], theta4_1[i]); // r4'
        L[6] = complex(r6_1_1[i], 0);
        L[7] = P_1[i];

        fprintf(fp, "link 0 0 %lf %lf %lf %lf %lf %lf\\\n",
                real(L[2]), imag(L[2]),
                real(L[3]), imag(L[3]),
                real(L[4]), imag(L[4]));
        fprintf(fp, "link %lf %lf %lf %lf\\\n",
                real(L[5]), imag(L[5]),
                real(L[6]), imag(L[6]));
        fprintf(fp, "rectangle %lf %lf %lf %lf\\\n",
                real(L[6]) - sliderWidth / 2, imag(L[6]) - sliderHeight / 2, sliderWidth, sliderHeight);
        fprintf(fp, "polygon fill gray90 %lf %lf %lf %lf %lf %lf\\\n",
                real(L[2]), imag(L[2]),
                real(L[3]), imag(L[3]),
                real(L[7]), imag(L[7]));
        fprintf(fp, "point trace %lf %lf\\\n", real(L[7]), imag(L[7]));
        fprintf(fp, "\n");
    }

    fclose(fp);

    qanimate partc.qnm

    return 0;
}
