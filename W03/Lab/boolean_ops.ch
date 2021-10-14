
#include <stdio.h>

int f1(int x, int y) {
    return 1<x && x<=20 || 3>=y && y>=1;
}

int f2(int x, int y) {
    return (1<x && x<=20) || (3>=y && y>=1);
}

int main(void) {
    int x, y;
    for(x = 0; x <= 21; x++) {
        for(y = 0; y <= 4; y++) {
            if(f1(x, y) != f2(x, y)) {
                printf("Fails for (%d, %d)\n", x, y);
            }
        }
    }
}
