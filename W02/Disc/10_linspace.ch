
#include <stdio.h>
#include <array.h>

int main(void)
{
    array double arr[11];

    /**
     * Use linspace() to fill an
     * empty array of a start and
     * endpoint with a uniform step
     */
    linspace(arr, 0.0, 5.0);

    printf("%.1lf\n", arr);

    return 0;
}