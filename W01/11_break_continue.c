#include <stdio.h>

int main()
{
    int i;
    for (i = 0; i < 30; i++)
    {
        if (i == 3)
        {
            continue;
        }
        else if (i == 5)
        {
            break;
        }
        else
        {
            printf("%d ", i);
        }
    }
    printf("\n");
    return 0;
}
