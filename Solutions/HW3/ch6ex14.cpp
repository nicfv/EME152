/**
 * Use a function to compute the volume of a sphere.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>

double volume(double r) {
   return (4.0 / 3.0) * M_PI * (r * r * r);
}

int main(void) {
   double r = 5.0;
   double vol;

   /* Calculate the volume. */
   vol = volume(r);

   /* Display the result. */
   printf("volume = %f m^3\n", vol);

   return 0;
}
