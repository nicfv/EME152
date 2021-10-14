
// Create a function prototype/signature that adds all the numbers in a computational array
// (Missing parameter names)

double arrayAdd(array double *, int);

int main(void) {
    
    array double arr[] = { 1, 2, 5, 9, 2, 5 };
    
    int length, sizeOfArr, sizeOfDouble;
    
    sizeOfArr = sizeof(arr);
    sizeOfDouble = sizeof(arr[0]);
    
    length = sizeOfArr / sizeOfDouble;
    
    printf("%d/%d = %d\n", sizeOfArr, sizeOfDouble, length);
    
    double theSum = arrayAdd(arr, length);
    
    printf("sum = %lf\n", theSum);
    
    // Create a computational array
    // Call the function and capture the return value
    // Print the return value
    
    return 0;
}

// Define the function
// (Function signature return vs. return statement)

double arrayAdd(array double *arr, int len) {
    int i;
    double theSum = 0;
    for(i = 0; i < len; i++) {
        theSum += arr[i];
    }
    return theSum;
}

// Dynamically calculate the length of the array
