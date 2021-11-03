/**
 * Calculate the interest over a period of 30 years.
 * Author: Nicolas Ventura
 */

#include <stdio.h>
#include <math.h>

int main(void)
{
    int n;
    double y, p, r;
    printf("Enter the principal ($): ");
    scanf("%lf", &p);
    printf("Enter the interest rate (%%): ");
    scanf("%lf", &r);
    printf("Year  Total\n");
    for (n = 1; n <= 30; n++)
    {
        y = p * pow((1.0 + r / 100), n);
        printf("%3d  $%.2f\n", n, y);
    }
    return 0;
}
