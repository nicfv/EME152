/* This program prints a box with side lengths specified by the user. */

#include <stdio.h>

int main()
{
    int width, height;
    int i, j;

    printf("Please enter the width of the box: ");
    scanf("%d", &width);

    printf("Please enter the height of the box: ");
    scanf("%d", &height);

    for (i = 0; i < height; i++)
    {
        for (j = 0; j < width; j++)
        {
            if ((j == 0 || j == (width - 1)) ||
                (i == 0 || i == (height - 1)))
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
