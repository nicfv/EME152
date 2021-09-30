/**
 * stdio.h (standard input/output) allows
 * the usage of printf and scanf.
 */
#include <stdio.h>
/**
 * math.h allows the usage of pow, sin,
 * cos, tan, and more math functions
 */
#include <math.h>

/**
 * main() is the entry point of any C
 * program. There must be exactly 1
 * of these functions per entire
 * program.
 */
int main() {
    double x, y;

    // Prompt the user to input an x value
    printf("Enter the x value: ");
    scanf("%lf", &x);

    // Calculate y using the math.h functions
    y = sin(x) + ((5 * pow(x, 2) + x) / (2 * x));

    // Print the result
    printf("y(%lf) = %lf\n", x, y);

    // Exit code
    return 0;
}
