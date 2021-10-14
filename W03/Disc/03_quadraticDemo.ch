
// Find the roots of the equation
// 2x^2 - x + 4

complex double a = 2, b = -1, c = 4;

complex double x1, x2;

x1 = (-b + sqrt(b*b - 4*a*c)) / (2*a);
x2 = (-b - sqrt(b*b - 4*a*c)) / (2*a);

printf("%lf, %lf\n", x1, x2);
