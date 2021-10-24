
/**
 * File: 01_matrix.ch
 * Author: Nicolas Ventura
 * The same file as 09_linsolve.ch
 * from discussion week 2.
 */

#include <stdio.h>
#include <array.h>

int main(void)
{
    array double A[2][2] = {1, 2, 3, 4},
                 b[2] = {2, 5},
                 x[2];

    /**
     * Use linsolve(x, A, b) to solve
     * the linear equation Ax = b
     */
    linsolve(x, A, b);

    printf("A=\n%.1lf\n", A);
    printf("x=\n%.1lf\n", x);
    printf("b=\n%.1lf\n", b);
    return 0;
}
