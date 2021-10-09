
#include <math.h>
#include <complex.h>
#include <float.h>

/**
 * Use printf to display a human-readable complex number.
 * Inputs:
 *  complex double comp: The complex number to print.
 * Outputs:
 *  None.
 */
void printComplex(complex double comp)
{
    double realPart = real(comp),
           imagPart = imag(comp);
    if (imagPart > DBL_EPSILON)
    {
        // a + bi
        printf("%lf + i%lf", realPart, imagPart);
    }
    else if (imagPart < -DBL_EPSILON)
    {
        // a - bi
        printf("%lf - i%lf", realPart, -imagPart);
    }
    else
    {
        // imagPart ~ 0
        printf("%lf", realPart);
    }
    printf("\n");
}

int main(void)
{
    complex double z;

    z = complex(-3, 4);
    printComplex(z);
    // -3.000000 + i4.000000

    z = polar(2, M_PI / 4.0);
    printComplex(z);
    // 1.414214 + i1.414214

    z = I;
    printComplex(z);
    // 0.000000 + i1.000000

    z = 3 * exp(-I * M_PI / 6.0);
    printComplex(z);
    // 2.598076 - i1.500000

    return 0;
}
