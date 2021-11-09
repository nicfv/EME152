/**
 * 07_qanimate.ch
 * Animate a linkage mechanism
 * Author: Nicolas Ventura
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <complex.h>
#include <array.h>

#define N 361 // Use 361 for 1 degree step size \
              // Use smaller number, e.g. 50, for faster animation

int main(void)
{
    int i;
    double r [1:4], theta [1:4], rp, beta;
    array double theta2[N], theta3_1[N], theta3_2[N], r4_1[N], r4_2[N];
    double complex z;
    double complex P_1[N], P_2[N];
    double r41, t31, r42, t32;

    double complex L [1:4];
    double sliderlength;
    double sliderwidth;
    FILE *fp;

    //-------------------------Part A----------------------------------
    // Determine theta3 and r4
    //-----------------------------------------------------------------

    // Define the fourbar linkage
    r[1] = 1.0;
    r[2] = 2.0;
    r[3] = 3.5;
    // r[4] = ? (output 1)
    theta[1] = deg2rad(90.0);
    // theta[2] = ? (input)
    // theta[3] = ? (output 2)
    theta[4] = deg2rad(0.0);
    rp = 1.5;
    beta = deg2rad(20.0);

    linspace(theta2, 0, deg2rad(360.0));

    // r1 + r4 = r2 + r3
    // r4 - r3 = r2 - r1
    //         = z

    // Analyze the fourbar with theta2 rotating from 0-360
    for (i = 0; i < N; i++)
    {
        // Determine theta2 and z
        theta[2] = theta2[i];
        z = polar(r[2], theta[2]) - polar(r[1], theta[1]);

        // Use complexsolvePR() to find theta3 and r4
        complexsolvePR(theta[4], -r[3], z, r41, t31, r42, t32);

        // First solution set
        r4_1[i] = r41;
        theta3_1[i] = t31;
        P_1[i] = polar(r[2], theta[2]) + polar(rp, theta3_1[i] + beta);

        // Second solution set
        r4_2[i] = r42;
        theta3_2[i] = t32;
        P_2[i] = polar(r[2], theta[2]) + polar(rp, theta3_2[i] + beta);
    }

    // Using unwrap() functions on theta3 is
    // recommended but not required for
    // QAnimate. If the problem asks you to
    // plot theta3, etc., then you should use the
    // unwrap() function before plotting.

    unwrap(theta3_1, theta3_1);
    unwrap(theta3_2, theta3_2);

    //-------------------------Part B-----------------------------------
    // Display required animations
    //------------------------------------------------------------------

    fp = fopen("animate2.qnm", "w");
    if (fp == NULL)
    {
        printf("Could not open 'animate1.qnm'\n");
        exit(-1);
    }

    sliderlength = 0.5;
    sliderwidth = sliderlength / 2;
    L[1] = polar(r[1], theta[1]);

    fprintf(fp, "#qanimate animation data\n");
    fprintf(fp, "title \"Slider Mechanism\"\n");
    fprintf(fp, "fixture\n");
    fprintf(fp, "groundpin 0 0\n");
    fprintf(fp, "ground %f %f %f %f\n",
            min(r4_1) - sliderlength / 2, -sliderwidth / 2 + imag(L[1]),
            max(r4_1) + sliderlength / 2, -sliderwidth / 2 + imag(L[1]));
    fprintf(fp, "animate restart\n");

    for (i = 0; i < N; i++)
    {
        // Determine theta2, theta3, and r4
        theta[2] = theta2[i];
        theta[3] = theta3_1[i];
        r[4] = r4_1[i];
        // Calculate complex vectors
        L[2] = polar(r[2], theta[2]);
        L[3] = L[2] + polar(r[3], theta[3]);
        L[4] = L[1] + polar(r[4], theta[4]);
        // Write frame number
        fprintf(fp, "#frame %d\n", i + 1);
        // Draw links 2 and 3
        fprintf(fp, "link 0 0 %f %f %f %f\\\n",
                real(L[2]), imag(L[2]),
                real(L[3]), imag(L[3]));
        // Draw the slider in red
        fprintf(fp, "rectangle %f %f %f %f angle %f pen red \\\n",
                real(L[4]) - sliderlength / 2, imag(L[4]) - sliderwidth / 2,
                sliderlength, sliderwidth, 0);
        // Draw the coupler
        fprintf(fp, "polygon fill grey90 %f %f %f %f %f %f \\\n",
                real(L[2]), imag(L[2]),
                real(L[3]), imag(L[3]),
                real(P_1[i]), imag(P_1[i]));
        // Trace the coupler point
        fprintf(fp, "point trace %f %f \\\n", real(P_1[i]), imag(P_1[i]));
        fprintf(fp, "\n");
    }

    fclose(fp);

    qanimate animate1.qnm
    //remove("animate1.qnm");

    return 0;
}
