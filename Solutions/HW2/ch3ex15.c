/**
 * Calculate the volume of a sphere
 * based on user input.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>

int main(void)
{
    double pi = M_PI,
           r = 5.0,
           volume;
    printf("Input the radius in meter:\n");
    scanf("%lf", &r);
    /* Calculate the volume. */
    volume = (4.0 / 3.0) * pi * r * r * r;
    /* Display the result. */
    printf("volume = %f m^3\n", volume);
    return 0;
}
