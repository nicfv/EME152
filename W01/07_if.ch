
int i = 5,
    j = -1;

if(i == 5) {
    printf("i == 5\n");
} else {
    printf ("i != 5\n");
}

if(i < 3) {
    printf("i < 3\n");
} else if(i > 3) {
    printf("i > 3\n");
} else {
    printf("i == 3\n");
}

if(i == 2 || i == 3) {
    printf("i is 2 or 3\n");
}

if((i >= 0 && j < 0) || (i < 0 && j >= 0)) {
    printf("i and j have opposite signs\n");
}

/**
 * Full list of comparison operators:
 *   ==
 *   !=
 *   >
 *   <
 *   >=
 *   <=
 * Other tips:
 *   !A         not A
 *   A && B     A and B
 *   A || B     A or B
 */
