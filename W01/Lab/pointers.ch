// Include this to have access to printf(...)
#include <stdio.h>

int main () {

    double num = 20.0;  // Assign a double value to a normal variable
    double *ptr;        // Declare a pointer that is pointing to an double value

    ptr = &num;         // Store address of num in pointer variable

    // Use the ampersand (&) to retrieve the memory address of num (the pointer of num)
    // The format specifier %x is used for pointers
    printf("Address of num (&num): %x\n", &num);

    // The variable ptr already stores an adress, not a value, so it
    // doesn't have to be referenced with (&)
    printf("Value of ptr:          %x\n", ptr);
    
    // Print out num normally
    printf("Value of num:          %lf\n", num);

    // Use the asterisk (*) to dereference ptr
    // This captures the int value of that memory address ptr
    printf("Value of *ptr:         %lf\n", *ptr);

    return 0;
}

// *ptr <===>  num
//  ptr <===> &num

/**
 * Example output:
 *
 * Address of num (&num): 21b7038
 * Value of ptr:          21b7038
 * Value of num:          20.000000
 * Value of *ptr:         20.000000
 */
