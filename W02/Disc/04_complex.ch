
#include <stdio.h>
#include <math.h>
#include <complex.h>

int main(void)
{
    complex double z;

    // z = 3 - 2i
    z = complex(3, -2);

    printf("%lf\n", z);

    // z = 5e^(i*pi/4)
    z = polar(5, M_PI / 4);

    printf("%lf\n", z);

    return 0;
}
