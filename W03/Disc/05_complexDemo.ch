
// Review of complex numbers
// (Complex and polar form)

// 2 + i
// 5e^(i120 deg)

complex double a = complex(2, 1);
complex double b = polar(5, deg2rad(120));

printf("%lf\n%lf\n", a, b);

// Complex number properties
// (Review of real, imag, abs, carg)

double realPart = carg(b);
printf("%lf\n", rad2deg(realPart));

// Print out a complex number in a human readable way
