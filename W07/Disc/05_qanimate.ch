/**
 * 05_qanimate.ch
 * Draw a linkage mechanism
 * Author: Nicolas Ventura
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <complex.h>

int main(void)
{
    int i;
    double r [1:4], theta [1:4], rp, beta;
    double complex z;
    double complex P;
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
    theta[2] = deg2rad(45.0);
    // theta[3] = ? (output 2)
    theta[4] = deg2rad(0.0);
    rp = 1.5;
    beta = deg2rad(20.0);

    // r1 + r4 = r2 + r3
    // r4 - r3 = r2 - r1
    //         = z

    // Determine z
    z = polar(r[2], theta[2]) - polar(r[1], theta[1]);

    // Use complexsolvePR() to find theta3 and r4
    complexsolvePR(theta[4], -r[3], z, r41, t31, r42, t32);

    // First solution set
    r[4] = r41;
    theta[3] = t31;
    P = polar(r[2], theta[2]) + polar(rp, theta[3] + beta);

    //-------------------------Part B-----------------------------------
    // Display required animations
    //------------------------------------------------------------------

    fp = fopen("animate1.qnm", "w");
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
            r[4] - sliderlength / 2, -sliderwidth / 2 + imag(L[1]),
            r[4] + sliderlength / 2, -sliderwidth / 2 + imag(L[1]));

    // Calculate complex vectors
    L[2] = polar(r[2], theta[2]);
    L[3] = L[2] + polar(r[3], theta[3]);
    L[4] = L[1] + polar(r[4], theta[4]);
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
            real(P), imag(P));
    // Trace the coupler point
    fprintf(fp, "point trace %f %f \\\n", real(P), imag(P));
    fprintf(fp, "\n");

    fclose(fp);

    qanimate animate1.qnm
    //remove("animate1.qnm");

    return 0;
}
