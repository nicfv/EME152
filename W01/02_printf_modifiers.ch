// ================ padding ================ //

int i2 = -136;

printf("Add space-padding before a number: |%6d|\n", i2);

printf("Add zero-padding before a number:  |%06d|\n", i2);

printf("\n");

// ================ precision ================ //

double d2 = -1.26000008;

printf("Print double normally:                 |%lf|\n", d2);

printf("Round/truncate a non-integer:          |%.1lf|\n", d2);

printf("Show more precision for a non-integer: |%.8lf|\n", d2);

printf("Combination of padding and precision:  |%11.3lf|\n", d2);

printf("\n");

// ================ scientific ================ //

double largeNumber = 21000000;

printf("Show number in scientific notation with 'e' specifier: %e\n", largeNumber);

printf("\n");

// ================ special ================ //

int answer = 42;

printf("Show number in binary with 'b' specifier: %b (only works in Ch)\n", answer);

printf("Show number in octal with 'o' specifier: %o\n", answer);

printf("Show number in hexadecimal with 'x' or 'X' specifier: %x, %X\n", answer, answer);

printf("\n");