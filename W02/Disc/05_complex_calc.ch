
#include <stdio.h>
#include <math.h>
#include <complex.h>

int main(void)
{
    double complex z;

    /* The following two lines are equivalent */
    z = (complex(1, 2) / complex(3, -4)) + (complex(5, -6) * complex(7, 8)) + exp(I * M_PI / 2);
    // z = (complex(1, 2) / complex(3, -4)) + (complex(5, -6) * complex(7, 8)) + polar(1, M_PI / 2);

    printf("real(z) = %.3f\n", real(z));
    printf("imag(z) = %.3f\n", imag(z));
    printf("abs(z) = %.3f\n", abs(z));
    printf("carg(z) = %.3f\n", carg(z));

    return 0;
}
