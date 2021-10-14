
// Orders of boolean operations
// A || B && C vs. (A || B) && C

int A, B, C;

A = 1; // true
B = 0; // false
C = 0; // false

int result = A || B && C;
            // 1 || 0 && 0
            // 1 || 0
            // 1

printf("%d\n", result);

result = (A || B) && C;
            // (1 || 0) && 0
            // 1 && 0
            // 0

printf("%d\n", result);
