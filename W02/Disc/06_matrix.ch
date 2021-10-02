
#include <stdio.h>
#include <array.h>

int main(void)
{
    int i, j, element;

    // Arrays are created in row-major order
    array int A[3][3] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

    printf("%d\n", A);

    i = 0;
    j = 2;

    /**
     * Select a single element with A[row][col]
     * Think A[y][x]
     * Returns a scalar value
     * Remember 0-indexed arrays
     */
    element = A[i][j];

    printf("A[%d][%d] = %d\n", i, j, element);

    return 0;
}
