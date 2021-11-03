/**
 * Calculate the volume and surface area of
 * a sphere and return those values as
 * function inputs.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>

void sphere(double r, double &volume, double &surface)
{
    volume = (4.0 / 3.0) * M_PI * r * r * r;
    surface = 4.0 * M_PI * r * r;
}

int main(void)
{
    double r, volume, surface;
    printf("Enter the radius (r) for a sphere in meters: ");
    scanf("%lf", &r);
    sphere(r, volume, surface);
    printf("volume = %lf (m^3)\n", volume);
    printf("surface = %lf (m^2)\n", surface);
    return 0;
}