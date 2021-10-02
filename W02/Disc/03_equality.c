
#include <stdio.h>
#include <math.h>
#include <float.h>

/**
 * Determine if two floats a and b are equal
 */
int float_equals(float a, float b)
{
    return fabs(a - b) < FLT_EPSILON;
}

/**
 * Determine if two doubles a and b are equal
 */
int double_equals(double a, double b)
{
    return fabs(a - b) < DBL_EPSILON;
}

/**
 * Run the program, don't accept any arguments
 */
int main(void)
{
    float flt1, flt2;
    double dbl1, dbl2;

    // These SHOULD be equal
    flt1 = 0.2f;
    flt2 = 0.3f - 0.1f;

    printf("flt1 = %.20f\n", flt1);
    printf("flt2 = %.20f\n", flt2);

    // Check for equality using the == comparitor
    printf("flt1 == flt2");
    if (flt1 == flt2)
    {
        printf(" passed!\n");
    }
    else
    {
        printf(" failed\n");
    }
    // Call the float_equals function
    if (float_equals(flt1, flt2))
    {
        printf("flt1 is about equal to flt2\n");
    }

    printf("\n");

    // These SHOULD be equal
    dbl1 = 1.2 - 0.8;
    dbl2 = 0.4;

    printf("dbl1 = %.20lf\n", dbl1);
    printf("dbl2 = %.20lf\n", dbl2);

    // Check for equality using the == comparitor
    printf("dbl1 == dbl2");
    if (dbl1 == dbl2)
    {
        printf(" passed!\n");
    }
    else
    {
        printf(" failed\n");
    }
    // Call the double_equals function
    if (double_equals(dbl1, dbl2))
    {
        printf("dbl1 is about equal to dbl2\n");
    }

    return 0;
}
