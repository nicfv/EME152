
// Pass an argument by reference
// Difference between by value and by reference
// Rewrite the quadratic formula as a function that returns the number of real solutions (0, 1, 2), but still outputs the solutions

// Existing example of passing by reference:

void square(int *d) {
    *d = (*d) * (*d);
}

int i = 5;

square(&i);

printf("%d\n", i);
