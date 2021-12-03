#include <math.h>
#include <crankslider.h>
int main() {
    CCrankSlider crankslider;
    double r2 = 1, r3 = 2, r4 = 0.5, theta1 = 10 * M_PI / 180; // REPLACE THIS
    double theta2 = 70 * M_PI / 180; // REPLACE THIS
    double complex As[1:2];
    double omega2 = 5; // REPLACE THIS
    double alpha2 = -5; // REPLACE THIS
    double first_theta3, sec_theta3;
    double first_omega3, sec_omega3;
    double first_alpha3, sec_alpha3;
    crankslider.setLinks(r2, r3, r4, theta1);
    crankslider.angularPos(theta2, first_theta3, sec_theta3);
    first_omega3 = crankslider.angularVel(theta2, first_theta3, omega2);
    sec_omega3 = crankslider.angularVel(theta2, sec_theta3, omega2);
    first_alpha3 = crankslider.angularAccel(theta2, omega2, first_theta3,
            first_omega3, alpha2);
    sec_alpha3 = crankslider.angularAccel(theta2, omega2, sec_theta3, sec_omega3,
            alpha2);
    As[1] = crankslider.sliderAccel(theta2, first_theta3, omega2, first_omega3,
            alpha2, first_alpha3);
    As[2] = crankslider.sliderAccel(theta2, sec_theta3, omega2, sec_omega3,
            alpha2, sec_alpha3);
    printf("Circuit 1: \n SliderAccleration: %f \n", As[1]);
    printf("Circuit 2: \n SliderAccleration: %f \n", As[2]);
}
