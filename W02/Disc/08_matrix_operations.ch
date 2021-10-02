#include <stdio.h>
#include <array.h>

int main(void)
{
    array int A[2][2] = {1, 2, 3, 4},
              B[2][2] = {3, 4, 1, 2},
              b[2][1] = {1, 2},
              x[2][1];

    x = (2 * A * B * b) + (A * b);

    printf("x =\n%d\n", x);

    return 0;
}
