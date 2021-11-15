
#include <complex.h>
#include <numeric.h>
#include <stdio.h>
#include <string.h>


#define NUMPOINTS 100

/**
 * Create a struct to store
 * the size and color of a slider.
 */
struct Slider {
    double width;
    double height;
    char color[32];
};

int main(void) {
    int i;
    double r[1:4], theta[1:4], theta2[NUMPOINTS], theta3[NUMPOINTS], r4[NUMPOINTS], theta3_extra, r4_extra;
    complex double z, L[1:4];
    FILE *fp;
    
    // Define the properties of the slider
    struct Slider slider;
    slider.width = 0.4;
    slider.height = 0.3;
    strcpy(slider.color, "red");
    
    r[1] = 1.2; // Vertical portion of the ground link
    r[2] = 2.5; // Input link
    r[3] = 6.5; // Floating link (crank shaft)
  //r[4] = ??   // Output link (distance from origin to piston)
    theta[1] = deg2rad(90.0);
  //theta[2] = ??
  //theta[3] = ??
    theta[4] = deg2rad(0.0);
    linspace(theta2, deg2rad(0.0), deg2rad(360.0)); // Set input angle
    /**
     * Unknowns:
     * r4 = ?
     * theta3 = ?
     * Loop closure equation:
     * r2 + r3 = r1 + r4
     * r4 - r3 = r2 - r1
     *         = z
     */
    for(i = 0; i < NUMPOINTS; i++) {
        // Calculate Z
        z = polar(r[2], theta2[i]) - polar(r[1], theta[1]);
        //             [[[[  knowns  ]]]] [first branch] [second branch]
        complexsolvePR(theta[4], -r[3], z, r[4], theta[3], r4_extra, theta3_extra);
        // Store values in array
        theta3[i] = theta[3];
        r4[i] = r[4];
    }
    printf("title \"Crank Slider Mechanism\"\n");
    printf("fixture\n");
    printf("groundpin 0 0\n");
    // min(array) returns the minimum value in that array
    // max(array) returns the maximum value in that array
    printf("ground %lf %lf %lf %lf\n", min(r4) /*- slider.width/2*/, r[1] - slider.height/2, max(r4) /*+ slider.width/2*/, r[1] - slider.height/2);
    printf("animate restart\n");
    for(i = 0; i < NUMPOINTS; i++) {
        L[1] = polar(r[1], theta[1]);
        L[2] = polar(r[2], theta2[i]);
        L[3] = L[2] + polar(r[3], theta3[i]);
        L[4] = L[1] + polar(r4[i], theta[4]);
        printf("#frame %d\n", i+1);
        printf("link 0 0 %lf %lf %lf %lf \\\n",
            real(L[2]), imag(L[2]),
            real(L[4]), imag(L[4]));
        printf("rectangle %lf %lf %lf %lf pen %s \\\n",
            real(L[4]) - slider.width/2, imag(L[4]) - slider.height/2,
            slider.width, slider.height, slider.color);
        printf("\n");
    }
    return 0;
}
