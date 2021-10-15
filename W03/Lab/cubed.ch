
// problem ch6.2.h

// prototype
double cube(float);

// definition
// added double
double cube(float number) {
    // can optionally cast it to double
    return (double)(number*number*number);
}


//////////////////////////////////

double cube(float);

int main() {
    return 0;
}

double cube(float num) {
    // can use pow()
    return (double)(pow(num, 3));
}
