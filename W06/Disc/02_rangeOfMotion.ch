/**
 * An example of using the CFourbar class
 * to find the range of motion.
 * Author: Nicolas Ventura
 */

#include <fourbar.h>

int main(void) {
    double r[1:4], theta1, rp, beta;
    array double theta2min[2], theta2max[2], theta4min[2], theta4max[2];
    /* Define the link lengths and theta1 */
    r[1] = 5.0;
    r[2] = 2.0;
    r[3] = 3.0;
    r[4] = 4.5;
    theta1 = deg2rad(15.0);
    rp = 2.8;
    beta = deg2rad(25.0);
    
    /* Set up the fourbar linkage */
    CFourbar fourbar;
    fourbar.uscUnit(false);
    fourbar.setLinks(r[1], r[2], r[3], r[4], theta1);
    fourbar.setCouplerPoint(rp, beta);
    
    /* Call getJointLimits() to find the range of motion */
    fourbar.getJointLimits(theta2min, theta2max, theta4min, theta4max);
    
    /* Print results for branch 1 */
    printf("\nFor branch 1:\n");
    printf("Theta2 = { %8.2lf, %8.2lf } rad = { %8.2lf, %8.2lf } deg\n",
        theta2min[0], theta2max[0], rad2deg(theta2min[0]), rad2deg(theta2max[0]));
    printf("Theta4 = { %8.2lf, %8.2lf } rad = { %8.2lf, %8.2lf } deg\n",
        theta4min[0], theta4max[0], rad2deg(theta4min[0]), rad2deg(theta4max[0]));
    printf("Theta2 range of motion = %8.2lf rad = %8.2lf deg\n",
        theta2max[0]-theta2min[0], rad2deg(theta2max[0]-theta2min[0]));
    printf("Theta4 range of motion = %8.2lf rad = %8.2lf deg\n",
        theta4max[0]-theta4min[0], rad2deg(theta4max[0]-theta4min[0]));
    
    /* Print results for branch 2 */
    printf("\nFor branch 2:\n");
    printf("Theta2 = { %8.2lf, %8.2lf } rad = { %8.2lf, %8.2lf } deg\n",
        theta2min[1], theta2max[1], rad2deg(theta2min[1]), rad2deg(theta2max[1]));
    printf("Theta4 = { %8.2lf, %8.2lf } rad = { %8.2lf, %8.2lf } deg\n",
        theta4min[1], theta4max[1], rad2deg(theta4min[1]), rad2deg(theta4max[1]));
    printf("Theta2 range of motion = %8.2lf rad = %8.2lf deg\n",
        theta2max[1]-theta2min[1], rad2deg(theta2max[1]-theta2min[1]));
    printf("Theta4 range of motion = %8.2lf rad = %8.2lf deg\n",
        theta4max[1]-theta4min[1], rad2deg(theta4max[1]-theta4min[1]));
    
    return 0;
}
