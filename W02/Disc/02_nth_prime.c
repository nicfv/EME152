#include <stdio.h>
#include <math.h>

int is_prime(int num); /* Define this function later */

int main()
{
    int num_primes = 0;
    int i = 1;
    int n;
    printf("Which prime number do you wish to find? : ");
    scanf("%d", &n);
    printf("Calculating...\n");
    for (i = 1; num_primes < n; i++) // i++ = i = i+1
    {
        /**
         * For each iteration, check whether i is prime. If it is, increment
         * our variable keeping track of the number of primes
         */
        if (is_prime(i))
        {
            num_primes++;
        }
    }

    i--;
    printf("The prime is %d\n", i);
    return 0;
}

/**
 * This function returns '1' (the truthy value) if input argument is prime.
 * Otherwise, it returns zero. (the false value)
 */
int is_prime(int num)
{
    int i;
    if(num == 1) { return 0; } // 1 is not prime
    if(num == 2) { return 1; } // 2 is prime
    for (i = 2; i < (sqrt(num) + 1); i++)
    {
        if ((num % i) == 0)
        { // If 'i' is a factor of num, then the number cannot be prime
            return 0;
        }
    }
    return 1;
}
