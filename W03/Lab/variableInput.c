
void square(double r, double *a, double *s) {
    // If you change r in here, it only changes in this scope (this function)
    // If you change a, or s, in here, it changes outside of this scope
    
    printf("in = %lf\n", r);
    printf("out1 = %x\n", a);
    printf("out2 = %x\n", s);
    
    double rVal = r;
    
    //*r = 10;
    
    *a = M_PI*rVal*rVal;
    *s = 4.0/3*M_PI*rVal*rVal*rVal;
    r = 10;
}

int main(void) {
    
    double r = 5, a, s;
    
    square(r, &a, &s);
    
    printf("r = %lf\n", r);
    printf("a = %lf\n", a);
    printf("s = %lf\n", s);
    
    return 0;
}
