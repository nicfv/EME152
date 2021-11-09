/**
 * 06_qanimate.ch
 * Draw a linkage mechanism but don't output to qanimate
 * Author: Nicolas Ventura
 */
#include <stdio.h>
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

    sliderlength = 0.5;
    sliderwidth = sliderlength / 2;
    L[1] = polar(r[1], theta[1]);

    printf("#qanimate animation data\n");
    printf("title \"Slider Mechanism\"\n");
    printf("fixture\n");
    printf("groundpin 0 0\n");
    printf("ground %f %f %f %f\n",
            r[4] - sliderlength / 2, -sliderwidth / 2 + imag(L[1]),
            r[4] + sliderlength / 2, -sliderwidth / 2 + imag(L[1]));

    // Calculate complex vectors
    L[2] = polar(r[2], theta[2]);
    L[3] = L[2] + polar(r[3], theta[3]);
    L[4] = L[1] + polar(r[4], theta[4]);
    // Draw links 2 and 3
    printf("link 0 0 %f %f %f %f\\\n",
            real(L[2]), imag(L[2]),
            real(L[3]), imag(L[3]));
    // Draw the slider in red
    printf("rectangle %f %f %f %f angle %f pen red \\\n",
            real(L[4]) - sliderlength / 2, imag(L[4]) - sliderwidth / 2,
            sliderlength, sliderwidth, 0);
    // Draw the coupler
    printf("polygon fill grey90 %f %f %f %f %f %f \\\n",
            real(L[2]), imag(L[2]),
            real(L[3]), imag(L[3]),
            real(P), imag(P));
    // Trace the coupler point
    printf("point trace %f %f \\\n", real(P), imag(P));
    printf("\n");

    return 0;
}
