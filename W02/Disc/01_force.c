
#include <stdio.h>

/**
 * Compute the linear force given a mass and acceleration.
 * Inputs:
 *  double m (the mass)
 *  double a (the acceleration)
 * Returns:
 *  A value of type double, representing the linear force.
 */
double Force(double m, double a)
{
    return (m * a);
}

/**
 * main(void) is the same as main()
 * Except here, it is explicit that no
 * parameters are passed to main
 */
int main(void)
{
    double mass, acceleration, linearForce;

    printf("Enter the mass (kg): ");
    scanf("%lf", &mass);
    
    printf("Enter the accel. (m/s^2): ");
    scanf("%lf", &acceleration);

    /**
     * Call the "Force" function by
     * passing in the mass and the
     * acceleration. The variable
     * linearForce takes the return
     * value of the function.
     */
    linearForce = Force(mass, acceleration);

    printf("\nForce = %lf N\n", linearForce);

    return 0;
}
