/**
 * Render the multiplication table.
 * Author: Nicolas Ventura
 */

#include <stdio.h>

int main(void) {
    int i, j;
    printf("        10  9   8   7   6   5   4   3   2   1\n");
    printf("  -------------------------------------------\n");
    for (i = 10; i >= 1; i--)
    {
        /* Outer loop */
        printf("%4d|", i);
        for (j = 10; j >= i; j--)
        {
            /* Inner loop */
            printf("%4d", i * j);
        }
        printf("\n");
    }
    printf("  -------------------------------------------\n");
    return 0;
}
