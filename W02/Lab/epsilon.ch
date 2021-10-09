
#include <float.h>

float epsilon = 1.0f;

while(epsilon+1 > 1)
    epsilon = epsilon / 2.0; // same as: epsilon /= 2

printf("%.25e\n", FLT_EPSILON);
printf("%.25e\n", epsilon*2);
