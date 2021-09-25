#include <stdio.h>
#include <math.h>

int main()
{
    int num_primes = 0;
    int i = 1;
    int j;
    int is_prime;
    int n;
    printf("Which prime number do you wish to find? : ");
    scanf("%d", &n);
    printf("Calculating...\n");
    for (i = 1; num_primes < n; i++)
    {
        /**
         * For each iteration, check whether i is prime. If it is, increment
         * our variable keeping track of the number of primes
         */
        is_prime = 1;
        for (j = 2; j < (sqrt(i) + 1); j++)
        {
            if ((i % j) == 0)
            { // If this is zero, then the number cannot be prime
                is_prime = 0;
            }
        }
        if (is_prime)
        {
            num_primes++;
        }
    }

    i--;
    printf("The prime is %d\n", i);
    return 0;
}
