#include <stdio.h>
#include <math.h>

int main() {
    
    // M_PI is a special constant that represents PI
    double pi = M_PI, x, y;

    // This is a special way to say "loop this forever"
    while (1)
    {
        // Request user input
        printf("x = ");
        scanf("%lf", &x);

        if(x < -pi || x > pi) {
            printf("x should be in the range [-pi, pi]\n");
            // Exit the program with an error code
            return 1;
        }

        // Calculate and print result
        y = sin(x);
        printf("sin(%.3lf) = %.3lf\n", x, y);
    }
    
    // Exit the program
    return 0;
}

/*

Sample output:

x = .75
sin(0.750) = 0.682
x = -1
sin(-1.000) = -0.841
x = 4
x should be in the range [-pi, pi]

*/