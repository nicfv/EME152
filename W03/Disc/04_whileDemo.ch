
// While Loop
// Find the first position of a "0" in a computational array

array double arr[] = { 1, 56, 3, 7, 0, 3, 5 };

int i = 0; // index to search

while(arr[i] != 0) {
    i++;
}

/* for(i = 0; i < 7; i++) {
    if(arr[i] == 0) {
        break;
    }
} */

printf("0 is at element %d\n", i);


double startVal = 0, step = 0.25, finalVal = 2, j = startVal;

while(j < finalVal) {
    j += step;
    printf("%lf, ", j);
}

