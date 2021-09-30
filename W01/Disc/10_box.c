/* This program prints a box with side lengths specified by the user. */

#include <stdio.h>

int main()
{
    int width, height;
    int y, x;

    printf("Please enter the width of the box: ");
    scanf("%d", &width);

    printf("Please enter the height of the box: ");
    scanf("%d", &height);

    for (y = 0; y < height; y++)
    {
        for (x = 0; x < width; x++)
        {
            if ((x == 0 || x == (width - 1)) ||
                (y == 0 || y == (height - 1)))
            {
                printf("*");
            }
            else
            {
                printf(" ");
            }
        }
        printf("\n");
    }

    return 0;
}
